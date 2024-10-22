package main

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

// Dummy username and password stored in variables
var storedUsername = "admin"
var storedPassword = "gina19901010"

func main() {
	router := gin.Default()

	// Login route - serves the login form
	router.GET("/login", func(c *gin.Context) {
		c.HTML(http.StatusOK, "login.html", nil)
	})

	// Handles login form submission
	router.POST("/login", func(c *gin.Context) {
		username := c.PostForm("username")
		password := c.PostForm("password")

		// Check if username and password match the stored values
		if username == storedUsername && password == storedPassword {
			c.String(http.StatusOK, "Login successful! Welcome %s!", username)
		} else {
			c.String(http.StatusUnauthorized, "Login failed! Invalid credentials.")
		}
	})

	// Load the HTML template for the login page
	router.LoadHTMLGlob("templates/*")

	// Start the web server
	router.Run(":8080")
}
