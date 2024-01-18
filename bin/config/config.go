package config

import (
	"crypto/rsa"
	"log"
	"os"
	"strconv"
	"strings"
	"time"

	"github.com/joho/godotenv"
)

type envConfig struct {
	AppEnv             string
	AppName            string
	AppPort            string
	AppVersion         string
	BasicAuthPassword  string
	BasicAuthUsername  string
	CipherKey          string
	ConfigCors         string
	IvKey              string
	LogLevel           string
	LogstashHost       string
	LogstashPort       string
	PrivateKey         *rsa.PrivateKey
	PublicKey          *rsa.PublicKey
	AccessTokenExpired time.Duration
	ShutdownDelay      int
	ServiceAccountPath string

	UrlZone              string
	ToogleActiveCheckout string

	StatHour   string
	StatMinute string
	StatSecond string

	TopicConsumerNotifInboxCms string
	TopicSendNotifInboxCms     string
}

func (e envConfig) LogstashPortInt() int {
	i, err := strconv.ParseInt(e.LogstashPort, 10, 64)
	if err != nil {
		panic(err)
	}

	return int(i)
}

var envCfg envConfig

func init() {
	err := godotenv.Load()

	if err != nil {
		println(err.Error())
	}

	shutdownDelay, _ := strconv.Atoi(os.Getenv("SHUTDOWN_DELAY")) // default 0

	path, err := os.Getwd()
	if err != nil {
		log.Println(err)
	}
	rootApp := strings.TrimSuffix(path, "/bin/config")
	os.Setenv("APP_PATH", rootApp)

	expTime, err := time.ParseDuration(os.Getenv("ACCESS_TOKEN_EXPIRED"))
	if err != nil {
		log.Println(err)
	}

	envCfg = envConfig{
		AppEnv:            os.Getenv("APP_ENV"),
		AppName:           os.Getenv("APP_NAME"),
		AppPort:           os.Getenv("APP_PORT"),
		AppVersion:        os.Getenv("APP_VERSION"),
		BasicAuthPassword: os.Getenv("BASIC_AUTH_PASSWORD"),
		BasicAuthUsername: os.Getenv("BASIC_AUTH_USERNAME"),
		CipherKey:         os.Getenv("AES_KEY"),
		ConfigCors:        os.Getenv("CORS_CONFIG"),
		IvKey:             "",
		LogLevel:          os.Getenv("LOG_LEVEL"),
		LogstashHost:      os.Getenv("LOGSTASH_HOST"),
		LogstashPort:      os.Getenv("LOGSTASH_PORT"),

		AccessTokenExpired: expTime,
		ShutdownDelay:      shutdownDelay,

		ServiceAccountPath:   os.Getenv("SERVICE_ACCOUNT_PATH"),
		UrlZone:              os.Getenv("URL_ZONE"),
		ToogleActiveCheckout: os.Getenv("TOOGLE_ACTIVE_CHECKOUT"),

		StatHour:   os.Getenv("STAT_HOUR_SCHEDULER"),
		StatMinute: os.Getenv("STAT_MINUTE_SCHEDULER"),
		StatSecond: os.Getenv("STAT_SECOND_SCHEDULER"),

		TopicConsumerNotifInboxCms: os.Getenv("TOPIC_CONSUMER_NOTIF_INBOX_CMS"),
		TopicSendNotifInboxCms:     os.Getenv("TOPIC_SEND_NOTIF_INBOX_CMS"),
	}
}

func GetConfig() *envConfig {
	return &envCfg
}
