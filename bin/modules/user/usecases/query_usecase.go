package usecases

import (
	"context"

	"coshion/bin/modules/user"
	"coshion/bin/modules/user/models"
	"coshion/bin/pkg/errors"
	// "coshion/bin/pkg/redis"
	"coshion/bin/pkg/utils"
)

type queryUsecase struct {
	userRepositoryQuery user.MongodbRepositoryQuery
}

func NewQueryUsecase(mq user.MongodbRepositoryQuery) user.UsecaseQuery {
	return &queryUsecase{
		userRepositoryQuery: mq,
	}
}

func (q queryUsecase) GetUser(ctx context.Context, userId string) utils.Result {
	var result utils.Result

	queryRes := <-q.userRepositoryQuery.FindOne(ctx, userId)

	if queryRes.Error != nil {
		errObj := errors.InternalServerError("Internal server error")
		result.Error = errObj
		return result
	}
	user := queryRes.Data.(models.User)
	res := models.GetUserResponse{
		Id:           user.Id,
		Username:     user.Username,
		Email:        user.Email,
		FullName:     user.FullName,
		MobileNumber: user.MobileNumber,
		Status:       user.Status,
	}
	result.Data = res
	return result
}
