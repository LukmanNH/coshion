package commands

import (
	"context"

	"coshion/bin/modules/user"
	"coshion/bin/modules/user/models"

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

func NewyFirestoreCommandRepository(fc *firestore.Client, fa *auth.Client) user.FirestoreRepositoryCommand {
	return &commandFirestoreRepository{
		firestoreClient: fc,
		firebaseAuth:    fa,
	}
}

func (c commandFirestoreRepository) UpdateOneUser(ctx context.Context, data models.User) <-chan utils.Result {
	output := make(chan utils.Result)

	go func() {
		defer close(output)

		docRef := c.firestoreClient.Collection("users").Doc(data.Id)

		updateMap := helpers.StructToMap(data.UpsertUser()) // Firestore only supports map

		_, err := docRef.Set(ctx, updateMap, firestore.MergeAll)

		if err != nil {
			output <- utils.Result{Error: err}
		}

		output <- utils.Result{Data: data}
	}()

	return output
}
