package main

import (
	"fmt"
	"log"
	"encoding/json"
	"math/rand"
	"net/http"
	"strconv"
	"github.com/gorilla/mux"
)

type Movie struct {
	ID string `json:"id"`
	Isbn string `json:"isbn"`
	Title string `json:"title"`
	Director *Director `json:"director"`
}

type Director {
	Firstname string `json:"firstname"`
	Lastname string `json:"lastname"`
}
var movies []Movie

func main()  {
	r := mux.NewRouter()
	
	r.Handlefunc()
}