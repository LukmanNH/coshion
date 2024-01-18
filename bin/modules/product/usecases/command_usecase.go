package usecases

import (
	"context"
	"coshion/bin/modules/product"
	"coshion/bin/modules/product/models"
	"coshion/bin/pkg/errors"
	"coshion/bin/pkg/utils"
)

type commandUsecase struct {
	productRepositoryQuery   product.FirestoreRepositoryQuery
	productRepositoryCommand product.FirestoreRepositoryCommand
}

func NewCommandUsecase(mq product.FirestoreRepositoryQuery, mc product.FirestoreRepositoryCommand) product.UsecaseCommand {
	return &commandUsecase{
		productRepositoryQuery:   mq,
		productRepositoryCommand: mc,
	}
}

func (c commandUsecase) CreateProduct(ctx context.Context, payload models.Product) utils.Result {
	var result utils.Result

	result = <-c.productRepositoryCommand.InsertOneProduct(ctx, payload)

	if result.Error != nil {
		errObj := errors.InternalServerError("Failed to create product")
		result.Error = errObj
		return result
	}

	return result
}

/* func (c commandUsecase) UpdateProduct(ctx context.Context, payload models.Product, decodedToken *auth.Token) utils.Result {
	var result utils.Result

	queryRes := <-c.productRepositoryQuery.FindOne(ctx, decodedToken)
	if queryRes.Data == nil {
		errObj := errors.NotFound("Product not found")
		result.Error = errObj
		return result
	}

	result = <-c.productRepositoryCommand.UpdateOneProduct(ctx, payload)

	if result.Error != nil {
		errObj := errors.InternalServerError("Failed to update product")
		result.Error = errObj
		return result
	}

	return result
} */

/* func (c commandUsecase) DeleteProduct(ctx context.Context, productId string) utils.Result {
	var result utils.Result

	queryRes := <-c.productRepositoryQuery.FindOne(ctx, productId)
	if queryRes.Data == nil {
		errObj := errors.NotFound("Product not found")
		result.Error = errObj
		return result
	}

	result = <-c.productRepositoryCommand.DeleteOneProduct(ctx, productId)
	if result.Error != nil {
		errObj := errors.InternalServerError("Failed delete product")
		result.Error = errObj
		return result
	}

	return result
} */
