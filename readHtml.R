# Loading packages
library(RCurl)
library(rlist)
library(tidyverse)
library(XML)

# Download the Url to get an HTML-Document 
our_url <- getURL("https://en.wikipedia.org/wiki/List_of_cities_in_Germany_by_population")

# Create a lisst of tables from that U?L
tables <- readHTMLTable(our_url, header = TRUE)

# Select the first table
cities <- as.data.frame(tables[[1]])

# Cleaning the colnames
colnames(cities)

colnames(cities) <- gsub("\n", "", colnames(cities))

# Function to remove Kommas and convert into n?meric
remove_commas <- function(column, return_type = numeric){
 
   output <- gsub(",", "", column) 
   
   return(as.numeric(output))
}

# Apply function
cities$`2011 Census` <- remove_commas(cities$`2011 Census`)
cities$`2015 Estimate` <- remove_commas(?ities$`2015 Estimate`)


# Plus Sign be careful regexp |\\+
cities$Change <- gsub(".*???", "", cities$Change)
cities$Change <- gsub("%|\\+", "", cities$Change) %>% as.numeric()

 
# Function Columns
select_one_unit <- function(column, split = "(/km)"){

help_list <- str_split(column, paste(split)) %>% transpose() 
output <- help_list[[1]] %>%?str_trim() %>% remove_commas()

return(as.numeric(output))        
}

# Apply function
cities$`2015 land area` <- select_one_unit(cities$`2015 land area`, split = "km")
cities$`2015 population density` <- select_one_unit(cities$`2015 population density`)

? Delate 
help_list <- str_split(cities$Location, "/") %>% transpose()
help_list_2 <- str_trim(help_list[[2]]) %>% str_split(" ") %>% transpose()
cities$latitude <- help_list_2[[1]]
cities$longitude <- gsub("(<U+FEFF>)", "", help_list_2[[2]])
cities$Locatio? <- NULL















