package queries

import (
	"context"

	"coshion/bin/modules/product"
	"coshion/bin/modules/product/models"
	"coshion/bin/pkg/utils"

	"cloud.google.com/go/firestore"
	"firebase.google.com/go/v4/auth"
	"google.golang.org/api/iterator"
)

type queryFirestoreRepository struct {
	firestoreClient *firestore.Client
	firebaseAuth    *auth.Client
}

func NewQueryFirestoreRepository(fc *firestore.Client, fa *auth.Client) product.FirestoreRepositoryQuery {
	return &queryFirestoreRepository{
		firestoreClient: fc,
		firebaseAuth:    fa,
	}
}

func (q queryFirestoreRepository) FindOne(ctx context.Context, productId string) <-chan utils.Result {
	output := make(chan utils.Result)

	go func() {
		defer close(output)

		// Check if product exists in Firestore
		docRef := q.firestoreClient.Collection("products").Doc(productId)
		docSnapshot, err := docRef.Get(ctx)

		if err != nil {
			output <- utils.Result{Error: err}
		}

		var product models.Product
		if err := docSnapshot.DataTo(&product); err != nil {
			output <- utils.Result{Error: err}
		}

		output <- utils.Result{Data: product}
	}()

	return output
}

func (q queryFirestoreRepository) FindAll(ctx context.Context, pageSize int, pageToken string) <-chan utils.Result {
	output := make(chan utils.Result)

	go func() {
		defer close(output)

		query := q.firestoreClient.Collection("products").OrderBy("productName", firestore.Asc).Limit(pageSize)

		if pageToken != "" {
			docSnapshot, err := q.firestoreClient.Collection("products").Doc(pageToken).Get(ctx)
			if err != nil {
				output <- utils.Result{Error: err}
				return
			}
			query = query.StartAfter(docSnapshot)
		}

		iter := query.Documents(ctx)
		var products []models.Product

		for {
			doc, err := iter.Next()
			if err == iterator.Done {
				break
			}

			var product models.Product
			if err := doc.DataTo(&product); err != nil {
				output <- utils.Result{Error: err}
			}

			products = append(products, product)
		}

		output <- utils.Result{Data: products}
	}()

	return output
}
