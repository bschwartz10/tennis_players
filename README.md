
Add tests for sorting methods
# Tennis Players

## Overview
This app takes in a collection of tennis players from three different input files
and generates a sorted output based on three different conditions. The conditions are:
 - Output 1 – sorted by gender (females before males) then by last name ascending
 - Output 2 – sorted by birth date, ascending then by last name ascending
 - Output 3 – sorted by last name, descending

### Dependencies
  * This app was created with ruby version 2.3.1
  * This application uses the built in Ruby date library and minitest for its testing library.

### Setup
To run this project, perform the following:
  1. `cd` into the project's directory
  2. Three rake commands have been set up to run the app
     1. `rake all` - Run all unit tests and output the target_output file
     2. `rake tests` - Run all unit tests
     3. `rake output` - Run runner file to generate target output
  3. Individual test files can be ran with `ruby test/file_name.rb`
  4. The runner file can be ran with `ruby lib/runner.rb`

### Design
The app is split into four separate classes:
* PlayersReader - read the txt file and create a RawPlayer object with each line
* RawPlayer- Normalize raw player data and create Player objects
* Player - Match each raw player attribute with the corresponding key
* PlayersWriter - write data to txt file with correct format

### Discussion
