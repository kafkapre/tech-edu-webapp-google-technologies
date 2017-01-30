package main

import (
	"fmt"
	"io/ioutil"
	"log"
	"net/http"

	"github.com/gin-gonic/gin"
)

func httpGetInfo(c *gin.Context) {
	c.JSON(http.StatusOK, gin.H{"msg": "Ping by Golang-server"})
}

func httpGetImage(c *gin.Context) {
	imgFileLocation := fmt.Sprintf("img/%s.jpg", c.Param("id"))
	img, err := ioutil.ReadFile(imgFileLocation)
	if err != nil {
		log.Printf("Error: image [path: %s] not found. \n", imgFileLocation)
		c.Data(http.StatusNotFound, "image/jpg", nil)
	} else {
		c.Data(http.StatusOK, "image/jpg", img)
	}
}

func main() {
	var router = gin.Default()
	log.Println("Golang server is RUNNING.")

	router.GET("/api/ping", func(c *gin.Context) { httpGetInfo(c) })

	router.GET("/api/img/:id", func(c *gin.Context) { httpGetImage(c) })

	router.Run(":4000")
}
