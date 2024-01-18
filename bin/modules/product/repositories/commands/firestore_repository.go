package commands

import (
	"context"

	"coshion/bin/modules/product"
	"coshion/bin/modules/product/models"

	// "coshion/bin/pkg/databases/firestore"
	"coshion/bin/pkg/helpers"
	"coshion/bin/pkg/utils"

	"cloud.google.com/go/firestore"
	"firebase.google.com/go/v4/auth"
)

type commandFirestoreRepository struct {
	firestoreClient *firestore.Client
	firebaseAuth    *auth.Client
}

func NewyFirestoreCommandRepository(fc *firestore.Client, fa *auth.Client) product.FirestoreRepositoryCommand {
	return &commandFirestoreRepository{
		firestoreClient: fc,
		firebaseAuth:    fa,
	}
}

func (c commandFirestoreRepository) InsertOneProduct(ctx context.Context, data models.Product) <-chan utils.Result {
	output := make(chan utils.Result)

	go func() {
		defer close(output)

		docRef := c.firestoreClient.Collection("products").NewDoc()

		dataId := docRef.ID
		data.Id = dataId
		dataMap := helpers.StructToMap(data)

		_, err := docRef.Set(ctx, dataMap)

		if err != nil {
			output <- utils.Result{Error: err}
		}

		output <- utils.Result{Data: data}
	}()

	return output
}

/* func (c commandFirestoreRepository) UpdateOneProduct(ctx context.Context, data models.Product) <-chan utils.Result {
    output := make(chan utils.Result)

    go func() {
        defer close(output)

        docRef := c.firestoreClient.Collection("products").Doc(data.Id)

        updateData := data.UpsertProduct() // Firestore only supports map

        _, err := docRef.Set(ctx, updateData, firestore.MergeAll)

        if err != nil {
            output <- utils.Result{Error: err}
        }

        output <- utils.Result{Data: data}
    }()

    return output
}
*/
