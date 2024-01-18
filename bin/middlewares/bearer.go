package middlewares

import (
	"strings"

	"coshion/bin/pkg/errors"
	"coshion/bin/pkg/helpers"
	"coshion/bin/pkg/token"

	"github.com/labstack/echo"
)

func VerifyBearer(next echo.HandlerFunc) echo.HandlerFunc {
	return func(c echo.Context) error {
		tokenString := strings.TrimPrefix(c.Request().Header.Get(echo.HeaderAuthorization), "Bearer ")

		if len(tokenString) == 0 {
			return helpers.RespError(c, errors.UnauthorizedError("Invalid token!"))
		}

		decodedToken, err := token.Validate(c.Request().Context(), tokenString)
		if err != nil {
			return helpers.RespError(c, errors.UnauthorizedError(err.Error()))
		}

		c.Set("decodedToken", decodedToken)
		return next(c)
	}
}
