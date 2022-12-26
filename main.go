package main

import (
	"TestJavan/controllers"
	"TestJavan/database"
	"fmt"
	"log"
	"net/http"
	"os"

	"github.com/gorilla/mux"
	_ "github.com/jinzhu/gorm/dialects/mysql"
	"github.com/joho/godotenv"
)

func main() {
	err := godotenv.Load(".env")
	if err != nil {
		log.Fatalf("Some error occured. Err: %s", err)
	}

	// Initialize Database
	database.ConnectDatabase()

	// Initialize the router
	router := mux.NewRouter().StrictSlash(true)

	// // Register Routes
	RegistertRoutes(router)

	// Start the server
	log.Println(fmt.Sprintf("Starting Server on port %s", os.Getenv("APP_PORT")))
	log.Fatal(http.ListenAndServe(fmt.Sprintf(":%v", os.Getenv("APP_PORT")), router))
}

func RegistertRoutes(router *mux.Router) {
	// Auth
	router.HandleFunc("/api/login", controllers.Login).Methods("POST")

	// Family
	router.HandleFunc("/api/family", controllers.IsAuthorized(controllers.CreateFamily)).Methods("POST")
	router.HandleFunc("/api/family/{id}", controllers.IsAuthorized(controllers.UpdateFamily)).Methods("PUT")
	router.HandleFunc("/api/family/{id}", controllers.IsAuthorized(controllers.DeleteFamily)).Methods("DELETE")
}
