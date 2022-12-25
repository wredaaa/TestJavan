package main

import (
	"TestJavan/database"
	"fmt"
	"log"
	"os"

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

	// Start the server
	log.Println(fmt.Sprintf("Starting Server on port %s", os.Getenv("APP_PORT")))
}
