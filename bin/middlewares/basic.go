package middlewares

import (
	"coshion/bin/config"
	"coshion/bin/pkg/errors"
	"coshion/bin/pkg/helpers"

	"github.com/labstack/echo"
)

func VerifyBasicAuth(next echo.HandlerFunc) echo.HandlerFunc {
	return func(c echo.Context) error {
		username, password, ok := c.Request().BasicAuth()
		if !ok {
			return helpers.RespError(c, errors.UnauthorizedError("invalid username or password"))
		}
		if username == config.GetConfig().BasicAuthUsername && password == config.GetConfig().BasicAuthPassword {
			return next(c)
		}
		return helpers.RespError(c, errors.UnauthorizedError("invalid username or password"))
	}
}

