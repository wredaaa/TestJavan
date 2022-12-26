package entities

import "time"

type Assets struct {
	ID        uint      `json:"id"`
	FamilyID  uint      `json:"family_id"`
	PersonID  uint      `json:"person_id"`
	Name      string    `json:"name"`
	Price     float64   `json:"price"`
	CreatedAt time.Time `gorm:"default:CURRENT_TIMESTAMP" json:"created_at"`
	UpdatedAt time.Time `gorm:"default:CURRENT_TIMESTAMP" json:"updated_at"`
}

type TotalAsset struct {
	ID         uint    `json:"id"`
	Name       string  `json:"name"`
	TotalPrice float64 `json:"total_price"`
}
