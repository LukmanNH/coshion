package token

import (
	"context"

	"coshion/bin/pkg/databases/firestore"

	"firebase.google.com/go/v4/auth"
)

func Validate(ctx context.Context, tokenString string) (*auth.Token, error) {
	firebaseAuth := firestore.GetFirebaseAuthConn()

	decodedToken, err := firebaseAuth.VerifyIDToken(ctx, tokenString)

	if err != nil {
		if auth.IsIDTokenExpired(err) {
			return nil, err
		}
	}

	return decodedToken, err
}
