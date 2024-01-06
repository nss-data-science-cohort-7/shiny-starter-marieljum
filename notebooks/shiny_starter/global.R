library(shiny)
library(tidyverse)
library(echarts4r)
library(magrittr)
library(dplyr)
library(shinydashboard)

gdp = read_csv("data/gdp_per_capita.csv")

gdp_le = read_csv("data/gdp_le.csv")

country_choices <- gdp |> 
  pull(`Country or Area`) |> 
  unique() |> 
  sort()

continent_choices <- gdp_le |> 
  pull(Continent) |> 
  unique() |> 
  sort()
