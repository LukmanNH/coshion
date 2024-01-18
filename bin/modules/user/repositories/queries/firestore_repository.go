package queries

import (
	"context"

	"coshion/bin/modules/user"
	"coshion/bin/modules/user/models"
	// "coshion/bin/pkg/databases/firestore"
	"coshion/bin/pkg/utils"

	"cloud.google.com/go/firestore"
	"firebase.google.com/go/v4/auth"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

type queryFirestoreRepository struct {
	firestoreClient *firestore.Client
	firebaseAuth    *auth.Client
}

func NewQueryFirestoreRepository(fc *firestore.Client, fa *auth.Client) user.FirestoreRepositoryQuery {
	return &queryFirestoreRepository{
		firestoreClient: fc,
		firebaseAuth:    fa,
	}
}

func (q queryFirestoreRepository) FindOne(ctx context.Context, decodedToken *auth.Token) <-chan utils.Result {
	output := make(chan utils.Result)

	go func() {
		defer close(output)

		// Extract user ID from the token
		userID := decodedToken.UID

		// Check if user exists in Firestore
		docRef := q.firestoreClient.Collection("users").Doc(userID)
		docSnapshot, err := docRef.Get(ctx)

		// TODO: create insertOneUser method in command_usecase instead
		if err != nil {
			if status.Code(err) == codes.NotFound {
				// User not found, create a new user record
				newUser := models.User{
					Id:           userID,
					MobileNumber: decodedToken.Claims["phone_number"].(string),
					// Populate other user fields as needed
				}
				_, err := docRef.Set(ctx, newUser)
				if err != nil {
					output <- utils.Result{Error: err}
					return
				}
				output <- utils.Result{Data: newUser}
				return
			}
			output <- utils.Result{Error: err}
			return
		}

		var user models.User
		if err := docSnapshot.DataTo(&user); err != nil {
			output <- utils.Result{Error: err}
			return
		}

		output <- utils.Result{Data: user}
	}()

	return output
}
