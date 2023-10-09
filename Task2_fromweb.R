
# Skeleton file 2 for Assignment 1 in BAN400. 
# -------------------------------------------

# More detailed steps to complete Problem 1.
install.packages("tidyverse")
install.packages("dplyr")
library(tidyverse)
library (dplyr)

# Reading the entire data file into memory using the readLines()-function from 
# URL direcly, called page_data.

page_data = readLines('http://www.sao.ru/lv/lvgdb/article/suites_dw_Table1.txt', warn = FALSE)


# Identify the line number L of the separator line between the column names and
# the rest of the data table.

substr(x = page_data, start = 1, stop = 2)

# The next step is then to find out *which* line starts with "--", and pick out
# the first one. This can be done in a nice little pipe, where you have to fill
# out the question marks and the missing function names:
L <- 
  (substr(x = page_data, start = 1, stop = 2) == "--") %>% 
  which() %>% 
  min()

# Save the variable descriptions (i.e. the information in lines 1:(L-2)) in a
# text-file for future reference using the cat()-function. The first argument is
# the information that we want to print out. In order to get each element in the
# "raw_file"-vector on a separate line we also provide the sep-argument, where
# we put the "end-of-line"-character "\n". We also need to come up with a file
# name. Replace the question marks:
cat(page_data, sep = "\n", file = "page_data.txt")

# Extract the variable names and store the names in a vector.

variable_names <- 
  str_split(string = page_data[L-1], pattern = "\\|") %>% 
  unlist() %>% 
  str_trim()


# Read the data into a csv file

csv <- 
  page_data %>% 
  gsub("\\|", ",", .) %>% 
  gsub(" ", "", .)

# add variable names

csv_names <- 
  c(paste(variable_names, collapse = ","),
    comma_separated_values)    

# Saving data into CSV file
cat(csv_names, sep = "\n", file = "galaxy_data")

# Read the file back in as a normal csv-file
galaxies_page <- read_csv("galaxy_data")


#As of March 2022 it should contain 796 observations -> But my data frame only includes 763, no matter how I read it (table or website)


