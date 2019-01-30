#!/bin/bash
#Author: Travis Torline
#Date: 1/30/2019

#Problem 1 Code:

#Here, we take a pattern from the user
echo "Enter a pattern here: "
read pattern

#we then take a filename from the user
echo "Enter a filename here: "
read filename

#we use the linux 'grep' command to search the user's file for their pattern
grep $pattern $filename 

#now, we want to seach for phone numbers in regex_practice
echo "The number of phone numbers in regex_practice.txt: "

#we use a regular expression to search
#we search for 3 numbers followed by a dash, 3 numbers followed by a dash, and make sure it ends in 4 numbers
grep -Ec "[0-9]{3}[-][0-9]{3}[-][0-9]{4}$" regex_practice.txt

#now, we want to search for emails in regex_practice
echo "The number of emails in regex_pracitce.txt: "

#we use a regular expression to search
#we search for aplhanumeric and some punctuation to start, then an @ sign, then an alphanmueric expression, then a dot, and a final alphabetic expression
grep -Ec "\b[A-Za-z0-9._%+-]+@[A-Za-z0-9]+\.[A-Za-z]+" regex_practice.txt

#now, we want to send the 303 phone numbers to a special file
echo "The list of 303 phone numbers in regex_practice.txt has been sent to phone_results.txt"

#we use a regular expression to search
#the search is same as before, but we specify that it must start with 303
#we send these results to phone_results.txt
grep -E "^303[-][0-9]{3}[-][0-9]{4}$" regex_practice.txt > phone_results.txt

#now, we want to send the @geocities emails to a special file
echo "The list of @geocities emails in regex_practice.txt has been sent to email_results.txt"

#we use a regular expression to search
#the search is the same as before, but we specify that it must be @geocities
#we send these results to email_results.txt
grep -E "\b[A-Za-z._%+-]+@geocities\.[A-Za-z]+" regex_practice.txt > email_results.txt

#now, we want to search for the command line argument the user passed
echo "The list of lines in regex_practice.txt that match the command line argument you passed has been sent to command_results.txt"

#command line argument is stored in $1, as filename is in $0
#send the results to command_results.txt
grep -E $1 regex_practice.txt > command_results.txt
