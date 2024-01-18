package usecases

import (
	"context"

	"coshion/bin/modules/user"
	"coshion/bin/modules/user/models"
	"coshion/bin/pkg/errors"

	// "coshion/bin/pkg/redis"
	"coshion/bin/pkg/utils"

	"firebase.google.com/go/v4/auth"
)

type queryUsecase struct {
	userRepositoryQuery user.FirestoreRepositoryQuery
}

func NewQueryUsecase(mq user.FirestoreRepositoryQuery) user.UsecaseQuery {
	return &queryUsecase{
		userRepositoryQuery: mq,
	}
}

func (q queryUsecase) GetUser(ctx context.Context, decodedToken *auth.Token) utils.Result {
	var result utils.Result

	queryRes := <-q.userRepositoryQuery.FindOne(ctx, decodedToken)

	if queryRes.Error != nil {
		errObj := errors.InternalServerError("Internal server error")
		result.Error = errObj
		return result
	}

	user := queryRes.Data.(models.User)
	res := models.GetUserResponse{
		Id:           user.Id,
		Email:        user.Email,
		FullName:     user.FullName,
		MobileNumber: user.MobileNumber,
		Gender:       user.Gender,
		Address:      user.Address,
	}
	result.Data = res
	return result
}
