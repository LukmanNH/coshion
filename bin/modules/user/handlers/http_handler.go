package handlers

import (
	"coshion/bin/middlewares"
	"coshion/bin/modules/user"
	"coshion/bin/modules/user/models"
	"coshion/bin/pkg/errors"
	"coshion/bin/pkg/helpers"

	"firebase.google.com/go/v4/auth"
	"github.com/labstack/echo"
)

type userHttpHandler struct {
	userUsecaseQuery   user.UsecaseQuery
	userUseCaseCommand user.UsecaseCommand
}

func InituserHttpHandler(e *echo.Echo, uq user.UsecaseQuery, uc user.UsecaseCommand) {
	handler := &userHttpHandler{
		userUsecaseQuery:   uq,
		userUseCaseCommand: uc,
	}

	route := e.Group("/coshion-api")

	route.GET("/users/v1", handler.Getuser, middlewares.VerifyBearer)
	route.PUT("/users/v1/update", handler.UpdateUser, middlewares.VerifyBearer)
	// route.DELETE("/users/v1/delete/:id", handler.DeleteUser, middlewares.VerifyBearer)
}

func (u userHttpHandler) Getuser(c echo.Context) error {
	decodedTokenInterface := c.Get("decodedToken")

	decodedToken, _ := decodedTokenInterface.(*auth.Token) // TODO: error handling when it's not ok

	result := u.userUsecaseQuery.GetUser(c.Request().Context(), decodedToken)

	if result.Error != nil {
		return helpers.RespError(c, result.Error)
	}

	return helpers.RespSuccess(c, result.Data, "Get user success")
}

func (u userHttpHandler) UpdateUser(c echo.Context) error {
	decodedTokenInterface := c.Get("decodedToken")

	decodedToken, ok := decodedTokenInterface.(*auth.Token)
	if !ok {
		return helpers.RespError(c, errors.BadRequest("error when casting decodedToken."))
	}

	req := new(models.User)
	req.Id = decodedToken.UID

	if err := c.Bind(req); err != nil {
		return helpers.RespError(c, errors.BadRequest("bad request."))
	}

	if req.Id == "" {
		return helpers.RespError(c, errors.BadRequest("id can't empty."))
	}

	result := u.userUseCaseCommand.UpdateUser(c.Request().Context(), *req, decodedToken)
	if result.Error != nil {
		return helpers.RespError(c, result.Error)
	}

	return helpers.RespSuccess(c, result.Data, "Register user success")
}

// func (u userHttpHandler) DeleteUser(c echo.Context) error {
// 	userId := c.Param("id")
// 	if userId == "" {
// 		return helpers.RespError(c, errors.BadRequest("id can't empty."))
// 	}
//
// 	result := u.userUseCaseCommand.DeleteUser(c.Request().Context(), userId)
// 	if result.Error != nil {
// 		return helpers.RespError(c, result.Error)
// 	}
//
// 	return helpers.RespSuccess(c, result.Data, "Delete user success")
// }
