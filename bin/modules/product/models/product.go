package models

import (
	"coshion/bin/pkg/helpers"
)

type Product struct {
	Id            string         `json:"id,omitempty" firestore:"id,omitempty"`
	Gender        string         `json:"gender" firestore:"gender"`
	ProductName   string         `json:"productName" firestore:"productName"`
	StoreName     string         `json:"storeName" firestore:"storeName"`
	Colours       []string       `json:"colours" firestore:"colours"`
	Sizes         []string       `json:"sizes" firestore:"sizes"`
	Stock         map[string]int `json:"stock" firestore:"stock"`
	ProductDetail string         `json:"productDetail" firestore:"productDetail"`
	Price         float64        `json:"price" firestore:"price"`
	Available     bool           `json:"available" firestore:"available"`
	Tags          []string       `json:"tags" firestore:"tags"`
	ImageURLs     []string       `json:"imageURLs" firestore:"imageURLs"`
}

type UpsertProduct struct {
	Gender        string         `json:"gender" firestore:"gender"`
	ProductName   string         `json:"productName" firestore:"productName"`
	StoreName     string         `json:"storeName" firestore:"storeName"`
	Colours       []string       `json:"colours" firestore:"colours"`
	Sizes         []string       `json:"sizes" firestore:"sizes"`
	Stock         map[string]int `json:"stock" firestore:"stock"`
	ProductDetail string         `json:"productDetail" firestore:"productDetail"`
	Price         float64        `json:"price" firestore:"price"`
	Available     bool           `json:"available" firestore:"available"`
	Tags          []string       `json:"tags" firestore:"tags"`
	ImageURLs     []string       `json:"imageURLs" firestore:"imageURLs"`
}

func (p Product) UpsertProduct() map[string]interface{} {
	product := UpsertProduct{
		Gender:        p.Gender,
		ProductName:   p.ProductName,
		StoreName:     p.StoreName,
		Colours:       p.Colours,
		Sizes:         p.Sizes,
		Stock:         p.Stock,
		ProductDetail: p.ProductDetail,
		Price:         p.Price,
		Available:     p.Available,
		Tags:          p.Tags,
		ImageURLs:     p.ImageURLs,
	}

	return helpers.StructToMap(product)
}

type GetProductResponse struct {
	Gender        string         `json:"gender"`
	ProductName   string         `json:"productName"`
	StoreName     string         `json:"storeName"`
	Colours       []string       `json:"colours"`
	Sizes         []string       `json:"sizes"`
	Stock         map[string]int `json:"stock"`
	ProductDetail string         `json:"productDetail"`
	Price         float64        `json:"price"`
	Available     bool           `json:"available"`
	Tags          []string       `json:"tags"`
	ImageURLs     []string       `json:"imageURLs"`
}
