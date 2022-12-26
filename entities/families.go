package entities

import "time"

type Families struct {
	ID        uint      `json:"id"`
	ParentID  uint      `json:"parent_id"`
	Name      string    `json:"name"`
	Gender    uint      `json:"gender"` //1=laki-laki 2=perempuan
	CreatedAt time.Time `gorm:"default:CURRENT_TIMESTAMP" json:"created_at"`
	UpdatedAt time.Time `gorm:"default:CURRENT_TIMESTAMP" json:"updated_at"`
}
