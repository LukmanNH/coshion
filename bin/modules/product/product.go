package product

import (
	"context"

	"coshion/bin/modules/product/models"
	"coshion/bin/pkg/utils"
	// "firebase.google.com/go/v4/auth"
)

type UsecaseQuery interface {
	// idiomatic go, ctx first before payload. See https://pkg.go.dev/context#pkg-overview
	GetProduct(ctx context.Context, productId string) utils.Result
	GetAllProduct(ctx context.Context, pageSize int, pageToken string) utils.Result
}

type UsecaseCommand interface {
	// idiomatic go, ctx first before payload. See https://pkg.go.dev/context#pkg-overview
	CreateProduct(ctx context.Context, payload models.Product) utils.Result
	// UpdateProduct(ctx context.Context, payload models.Product, productId string) utils.Result
	/* DeleteProduct(ctx context.Context, productId string) utils.Result */
}

type FirestoreRepositoryQuery interface {
	// idiomatic go, ctx first before payload. See https://pkg.go.dev/context#pkg-overview
	FindOne(ctx context.Context, productId string) <-chan utils.Result
	FindAll(ctx context.Context, pageSize int, pageToken string) <-chan utils.Result
}

type FirestoreRepositoryCommand interface {
	// idiomatic go, ctx first before payload. See https://pkg.go.dev/context#pkg-overview
	// NewObjectID(ctx context.Context) string
	InsertOneProduct(ctx context.Context, data models.Product) <-chan utils.Result
	// UpdateOneProduct(ctx context.Context, data models.Product) <-chan utils.Result
	/* DeleteOneProduct(ctx context.Context, productId string) <-chan utils.Result */
}
