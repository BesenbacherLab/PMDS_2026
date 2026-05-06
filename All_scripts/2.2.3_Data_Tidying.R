#####
# 
# Loading Data in R
#
# Søren Besenbacher
# Aarhus University
# 
#####

################################################################################
#### SECTION 1: Loading Required Packages ####
################################################################################

# Load the tidyverse package which includes functions for tidying and merging 
# data sets
library(tidyverse)


################################################################################
#### PART 1: Tidying Data Sets ####
################################################################################

################################################################################
#### EXAMPLE 1: Make data sets longer ####
################################################################################

# The data set below has three rows and four columns:
students <- tibble(
  student = c("Alice", "Bob", "Charlie"),
  math = c(90, 85, 92),
  science = c(95, 88, 91),
  history = c(87, 92, 78)
)

# We can make that into a longer data set by splitting some columns into multiple
# rows using the function "pivot_longer".
# We just need to specify which columns should be changed:

students_long <-
  students |>
    pivot_longer(
      cols = c("math", "science", "history")
    )

# Take a look at the resulting data set. By default the names of the old columns
# are saved in a column called "name" and their values are saved in a column 
# called "value". We can choose different columns names:

students_long <-
  students |>
  pivot_longer(
    cols = c("math", "science", "history"),
    names_to = "subject",
    values_to = "score"
  )

# Instead of specifying which columns should be changed we can also specify 
# which columns should not be changed by putting a "-" in front of the list:

students_long <-
  students |>
  pivot_longer(
    cols = - c("student"),
    names_to = "subject",
    values_to = "score"
  )


################################################################################
#### EXAMPLE 2: Make data sets wider ####
################################################################################

# We can make the reverse transformation by using the function "pivot_wider":
students_long |>
  pivot_wider(
    names_from = subject,
    values_from = score
  )

################################################################################
#### EXERCISES ####
################################################################################

# EXERCISE 1, pivot_longer
## The file "pivot_example.csv" contains a simulated data set with counts for 
## how many cases of different cancer types occurred each year.
## Read the file and make the data tidy by using the pivot_longer function.

d <- read_csv("Data/pivot_example.csv")

d |> pivot_longer(?)

# EXERCISE 2, pivot_wider
## Take a look at the data set called us_rent_income. It has data by US state for 
## median annual income and median monthly rent, plus margins of error for each.
## Create a more human-readable version of this data set by letting income and 
## rent have their own columns: income estimate, income margin of error, rent estimate, and 
## rent margin of error
## Hint: instead of a single values_from column you can specify a list of columns


################################################################################
#### EXTRA EXERCISE  (If there is time) ####
################################################################################

# Exercise 3
## Let's read in a data set about different glaucoma data
glaucoma_data <- read_rds("Data/glaucoma_data.rds")

## We now want to create plots showing the distribution of each variable for 
## cases and controls.
##
## An easy way to do this is to first make the data longer. So it looks like this:
#
# glaucoma name              value
# <fct>    <chr>             <dbl>
#  0        age               62   
#  0        ocular_pressure   17   
#  0        MD                -0.54
#

## Then use geom_density and facet_wrap to produce density plots with two different 
## colors depending on the glaucoma variable for each name.
## hint: since the variables have different ranges you need to set the scale 
## parameter in facet_wrap to "free" to make the plots look nice.

