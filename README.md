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
The app is split into three separate classes:
* PlayerIo - read/write data
* Player - Normalize player data and create Player objects
* SortedPlayerCollection - Sort and store Player objects

### Discussion
The overall design was constructed with the assumption that the app has three core functionalities.
  1. Read/Write data
  2. Normalize Data
  3. Sort data according business requirements

The PlayerIo class houses both methods to read/write data. The Player class normalizes the data coming from the three different input files. SortedPlayerCollection sorts the data according to specified requirements.

My goal was to keep the application simple while maintaining future flexibility. For example if the requirements were to parse 20 different types of files and none of the data was consistent, I would consider splitting the Player class into two or more specified classes. The first class would create all the different structs and the second class would normalize the data.

In this iteration I am testing my private methods using the .send method. I know there is opinions about this topic and wanted to acknowledge that I am open to testing or not testing my private methods. I chose to encapsulate(privatize) the methods I don't use in the runner to make the classes more secure.

I am using test fixture files for testing the File IO for the app. Since there are only three lines in each input file I chose to use the entire file in my test fixture. If there were thousands of lines in these files I would minimize the amount of data I needed in my test fixtures.
