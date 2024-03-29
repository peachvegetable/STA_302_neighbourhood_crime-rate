library(opendatatoronto)
library(dplyr)

# get package
package <- show_package("neighbourhood-crime-rates")
package

# get all resources for this package
resources <- list_package_resources("neighbourhood-crime-rates")

# identify datastore resources; by default, Toronto Open Data sets datastore 
# resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 
                                                                'geojson'))

# load the first datastore resource
neighbourhood_crime_rates <- filter(datastore_resources, row_number()==1) %>% 
  get_resource()

dir_path <- "Input/Data"
file_path <- file.path(dir_path, "unedited_data.csv")

write_csv(
  x = neighbourhood_crime_rates,
  file = file_path
)
