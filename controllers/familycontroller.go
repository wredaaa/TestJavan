package controllers

import (
	"TestJavan/database"
	"TestJavan/entities"
	"encoding/json"
	"net/http"

	"github.com/gorilla/mux"
)

func CreateFamily(w http.ResponseWriter, r *http.Request) {
	connection := database.ConnectDatabase()
	defer database.CloseDatabase(connection)

	w.Header().Set("Content-Type", "application/json")

	var families entities.Families
	json.NewDecoder(r.Body).Decode(&families)

	connection.Create(&families)
	json.NewEncoder(w).Encode(families)
}

func UpdateFamily(w http.ResponseWriter, r *http.Request) {
	connection := database.ConnectDatabase()
	defer database.CloseDatabase(connection)

	familyID := mux.Vars(r)["id"]
	var families entities.Families
	connection.First(&families, familyID)
	if families.ID == 0 {
		json.NewEncoder(w).Encode("Data Not Found!")
		return
	}
	json.NewDecoder(r.Body).Decode(&families)

	connection.Save(&families)
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(families)
}

func DeleteFamily(w http.ResponseWriter, r *http.Request) {
	connection := database.ConnectDatabase()
	defer database.CloseDatabase(connection)

	familyID := mux.Vars(r)["id"]
	var families entities.Families
	connection.First(&families, familyID)
	if families.ID == 0 {
		json.NewEncoder(w).Encode("Data Not Found!")
		return
	}
	json.NewDecoder(r.Body).Decode(&families)

	connection.Delete(&families)
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode("Deleted!")
}
