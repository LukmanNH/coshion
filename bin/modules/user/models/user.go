package models

import "coshion/bin/pkg/helpers"

// type Addr struct {
//   Deskripsi string `json:"deskripsi"`
//   Jalan     string `json:"jalan"`
//   Kecamatan string `json:"kecamatan"`
//   Kota      string `json:"kota"`
//   KodePos   string `json:"kodePos"`
// }

type User struct {
	Id           string `json:"id,omitempty" firestore:"id,omitempty"`
	Email        string `json:"email" firestore:"email"`
	FullName     string `json:"fullName" firestore:"fullName"`
	Gender       string `json:"gender" firestore:"gender"`
	MobileNumber string `json:"mobileNumber" firestore:"mobileNumber"`
	Address      string `json:"address" firestore:"address"`
}

type UpsertUser struct {
	Email        string `json:"email,omitempty" firestore:"email,omitempty"`
	FullName     string `json:"fullName,omitempty" firestore:"fullName,omitempty"`
	MobileNumber string `json:"mobileNumber,omitempty" firestore:"mobileNumber,omitempty"`
	Address      string `json:"address" firestore:"address,omitempty"`
	Gender       string `json:"gender" firestore:"gender,omitempty"`
}

func (u User) UpsertUser() map[string]interface{} {
	user := UpsertUser{
		Email:        u.Email,
		FullName:     u.FullName,
		MobileNumber: u.MobileNumber,
		Address:      u.Address,
		Gender:       u.Gender,
	}

	return helpers.StructToMap(user)
}

type GetUserResponse struct {
	Id           string `json:"id,omitempty"`
	Email        string `json:"email"`
	FullName     string `json:"fullName"`
	Gender       string `json:"gender"`
	MobileNumber string `json:"mobileNumber"`
	Address      string `json:"address"`
}
