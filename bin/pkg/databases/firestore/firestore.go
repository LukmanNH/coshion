package firestore

import (
	"context"
	"coshion/bin/config"
	"fmt"

	"cloud.google.com/go/firestore"
	firebase "firebase.google.com/go/v4"
	"firebase.google.com/go/v4/auth"
	"google.golang.org/api/option"
)

var firestoreClient *firestore.Client
var firebaseAuthClient *auth.Client

func InitConnection() {
	ctx := context.Background()

	sa := option.WithCredentialsFile(config.GetConfig().ServiceAccountPath)

	app, err := firebase.NewApp(ctx, nil, sa)

	if err != nil {
		panic(err)
	}

	fmt.Println("Successfully initialized Firebase app")

	fClient, err := app.Firestore(ctx)
	if err != nil {
		panic(err)
	}

	fmt.Println("Successfully initialized Firestore client")

	fAuthClient, err := app.Auth(ctx)
	if err != nil {
		panic(err)
	}

	fmt.Println("Successfully initialized Firebase Auth client")

	firestoreClient = fClient
	firebaseAuthClient = fAuthClient
	/**
	  TODO: import firestoreDbName via config struct
	*/
}

func GetFirebaseAuthConn() *auth.Client {
	return firebaseAuthClient
}

func GetFirestoreConn() *firestore.Client {
	return firestoreClient
}
