package user

import (
	"context"

	"coshion/bin/modules/user/models"
	"coshion/bin/pkg/utils"

	"firebase.google.com/go/v4/auth"
)

type UsecaseQuery interface {
	// idiomatic go, ctx first before payload. See https://pkg.go.dev/context#pkg-overview
	GetUser(ctx context.Context, decodedToken *auth.Token) utils.Result
}

type UsecaseCommand interface {
	// idiomatic go, ctx first before payload. See https://pkg.go.dev/context#pkg-overview
	UpdateUser(ctx context.Context, payload models.User, decodedToken *auth.Token) utils.Result
	/* DeleteUser(ctx context.Context, userId string) utils.Result */
}

type FirestoreRepositoryQuery interface {
	// idiomatic go, ctx first before payload. See https://pkg.go.dev/context#pkg-overview
	FindOne(ctx context.Context, decodedToken *auth.Token) <-chan utils.Result
}

type FirestoreRepositoryCommand interface {
	// idiomatic go, ctx first before payload. See https://pkg.go.dev/context#pkg-overview
	// NewObjectID(ctx context.Context) string
	// InsertOneUser(ctx context.Context, data models.User) <-chan utils.Result
	UpdateOneUser(ctx context.Context, data models.User) <-chan utils.Result
	/* DeleteOneUser(ctx context.Context, userId string) <-chan utils.Result */
}
