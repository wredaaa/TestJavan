package controllers

import (
	"TestJavan/database"
	"TestJavan/entities"
	"encoding/json"
	"net/http"

	"github.com/gorilla/mux"
)

func GetAsset(w http.ResponseWriter, r *http.Request) {
	connection := database.ConnectDatabase()
	defer database.CloseDatabase(connection)

	var total_asset []entities.TotalAsset
	connection.Raw("SELECT id, name, (SELECT SUM(price) FROM assets WHERE person_id = families.id) as 'total_price' FROM families").Scan(&total_asset)

	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(http.StatusOK)
	json.NewEncoder(w).Encode(total_asset)
}

func CreateAsset(w http.ResponseWriter, r *http.Request) {
	connection := database.ConnectDatabase()
	defer database.CloseDatabase(connection)

	w.Header().Set("Content-Type", "application/json")

	var asset entities.Assets
	json.NewDecoder(r.Body).Decode(&asset)

	connection.Create(&asset)
	json.NewEncoder(w).Encode(asset)
}

func UpdateAsset(w http.ResponseWriter, r *http.Request) {
	connection := database.ConnectDatabase()
	defer database.CloseDatabase(connection)

	assetID := mux.Vars(r)["id"]
	var asset entities.Assets
	connection.First(&asset, assetID)
	if asset.ID == 0 {
		json.NewEncoder(w).Encode("Data Not Found!")
		return
	}
	json.NewDecoder(r.Body).Decode(&asset)

	connection.Save(&asset)
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(asset)
}

func DeleteAsset(w http.ResponseWriter, r *http.Request) {
	connection := database.ConnectDatabase()
	defer database.CloseDatabase(connection)

	assetID := mux.Vars(r)["id"]
	var asset entities.Assets
	connection.First(&asset, assetID)
	if asset.ID == 0 {
		json.NewEncoder(w).Encode("Data Not Found!")
		return
	}
	json.NewDecoder(r.Body).Decode(&asset)

	connection.Delete(&asset)
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode("Deleted!")
}
