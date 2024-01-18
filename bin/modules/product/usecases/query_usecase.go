package usecases

import (
	"context"
	"coshion/bin/modules/product"
	"coshion/bin/pkg/errors"
	"coshion/bin/pkg/utils"
)

type queryUsecase struct {
	productRepositoryQuery product.FirestoreRepositoryQuery
}

func NewQueryUsecase(mq product.FirestoreRepositoryQuery) product.UsecaseQuery {
	return &queryUsecase{
		productRepositoryQuery: mq,
	}
}

func (c queryUsecase) GetProduct(ctx context.Context, productId string) utils.Result {
	var result utils.Result

	result = <-c.productRepositoryQuery.FindOne(ctx, productId)

	if result.Error != nil {
		errObj := errors.InternalServerError("Failed to get product")
		result.Error = errObj
		return result
	}

	return result
}

func (c queryUsecase) GetAllProduct(ctx context.Context, pageSize int, pageToken string) utils.Result {
	var result utils.Result

	result = <-c.productRepositoryQuery.FindAll(ctx, pageSize, pageToken)

	if result.Error != nil {
		errObj := errors.InternalServerError("Failed to get product")
		result.Error = errObj
		return result
	}

	return result

}
