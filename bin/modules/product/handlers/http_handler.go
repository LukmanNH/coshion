package handlers

import (
	"coshion/bin/middlewares"
	"coshion/bin/modules/product"
	"coshion/bin/modules/product/models"
	"coshion/bin/pkg/errors"
	"coshion/bin/pkg/helpers"
	"strconv"

	"github.com/labstack/echo"
)

type productHttpHandler struct {
	productUsecaseQuery   product.UsecaseQuery
	productUseCaseCommand product.UsecaseCommand
}

func InitproductHttpHandler(e *echo.Echo, uq product.UsecaseQuery, uc product.UsecaseCommand) {
	handler := &productHttpHandler{
		productUsecaseQuery:   uq,
		productUseCaseCommand: uc,
	}

	route := e.Group("/coshion-api")

	route.GET("/products/v1/:id", handler.Getproduct, middlewares.VerifyBearer)
	route.GET("/products/v1", handler.GetAllproduct, middlewares.VerifyBearer)
	route.POST("/products/v1", handler.CreateProduct, middlewares.VerifyBearer)
	// route.DELETE("/products/v1/delete/:id", handler.DeleteProduct, middlewares.VerifyBearer)
}

func (u productHttpHandler) Getproduct(c echo.Context) error {
	productId := c.Param("id")

	result := u.productUsecaseQuery.GetProduct(c.Request().Context(), productId)

	if result.Error != nil {
		return helpers.RespError(c, result.Error)
	}

	return helpers.RespSuccess(c, result.Data, "Get product success")
}

func (u productHttpHandler) GetAllproduct(c echo.Context) error {
	pageSize, _ := strconv.Atoi(c.QueryParam("pageSize"))
	pageToken := c.QueryParam("pageToken")

	result := u.productUsecaseQuery.GetAllProduct(c.Request().Context(), pageSize, pageToken)

	if result.Error != nil {
		return helpers.RespError(c, result.Error)
	}

	return helpers.RespSuccess(c, result.Data, "Get all products success")
}

func (u productHttpHandler) CreateProduct(c echo.Context) error {
	req := new(models.Product)

	if err := c.Bind(req); err != nil {
		return helpers.RespError(c, errors.BadRequest("bad request."))
	}

	result := u.productUseCaseCommand.CreateProduct(c.Request().Context(), *req)
	if result.Error != nil {
		return helpers.RespError(c, result.Error)
	}

	return helpers.RespSuccess(c, result.Data, "Creating product success")
}

// func (u productHttpHandler) UpdateProduct(c echo.Context) error {
// 	decodedTokenInterface := c.Get("decodedToken")
//
//   decodedToken, ok := decodedTokenInterface.(*auth.Token)
//   if (!ok) {
//     return helpers.RespError(c, errors.BadRequest("error when casting decodedToken."))
//   }
//
// 	req := new(models.Product)
// 	req.Id = decodedToken.UID
//
// 	if err := c.Bind(req); err != nil {
// 		return helpers.RespError(c, errors.BadRequest("bad request."))
// 	}
//
// 	if req.Id == "" {
// 		return helpers.RespError(c, errors.BadRequest("id can't empty."))
// 	}
//
// 	result := u.productUseCaseCommand.UpdateProduct(c.Request().Context(), *req, decodedToken)
// 	if result.Error != nil {
// 		return helpers.RespError(c, result.Error)
// 	}
//
// 	return helpers.RespSuccess(c, result.Data, "Register product success")
// }

// func (u productHttpHandler) DeleteProduct(c echo.Context) error {
// 	productId := c.Param("id")
// 	if productId == "" {
// 		return helpers.RespError(c, errors.BadRequest("id can't empty."))
// 	}
//
// 	result := u.productUseCaseCommand.DeleteProduct(c.Request().Context(), productId)
// 	if result.Error != nil {
// 		return helpers.RespError(c, result.Error)
// 	}
//
// 	return helpers.RespSuccess(c, result.Data, "Delete product success")
// }
