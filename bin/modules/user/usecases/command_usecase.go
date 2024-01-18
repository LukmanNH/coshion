package usecases

import (
	"context"
	"coshion/bin/modules/user"
	"coshion/bin/modules/user/models"
	"coshion/bin/pkg/errors"
	"coshion/bin/pkg/utils"

	"firebase.google.com/go/v4/auth"
)

type commandUsecase struct {
	userRepositoryQuery   user.FirestoreRepositoryQuery
	userRepositoryCommand user.FirestoreRepositoryCommand
}

func NewCommandUsecase(mq user.FirestoreRepositoryQuery, mc user.FirestoreRepositoryCommand) user.UsecaseCommand {
	return &commandUsecase{
		userRepositoryQuery:   mq,
		userRepositoryCommand: mc,
	}
}

func (c commandUsecase) UpdateUser(ctx context.Context, payload models.User, decodedToken *auth.Token) utils.Result {
	var result utils.Result

	queryRes := <-c.userRepositoryQuery.FindOne(ctx, decodedToken)
	if queryRes.Data == nil {
		errObj := errors.NotFound("User not found")
		result.Error = errObj
		return result
	}

	result = <-c.userRepositoryCommand.UpdateOneUser(ctx, payload)

	if result.Error != nil {
		errObj := errors.InternalServerError("Failed to update user")
		result.Error = errObj
		return result
	}

	return result
}

/* func (c commandUsecase) DeleteUser(ctx context.Context, userId string) utils.Result {
	var result utils.Result

	queryRes := <-c.userRepositoryQuery.FindOne(ctx, userId)
	if queryRes.Data == nil {
		errObj := errors.NotFound("User not found")
		result.Error = errObj
		return result
	}

	result = <-c.userRepositoryCommand.DeleteOneUser(ctx, userId)
	if result.Error != nil {
		errObj := errors.InternalServerError("Failed delete user")
		result.Error = errObj
		return result
	}

	return result
} */
