# Data550 Final Project

This project focuses looking at the overall vaccination coverage among adolescents over time for a variety of vaccines. 

## Building The Report


MacOS: run "make report_m"" if using a Mac machine.
Windows: run "make report_w" if using a Windows machine

## Other Makefile Rules

Install Necessary Packages: make install

Build the report on your local machine outside of a container: make Final_Project.html

Create the output of table1: make Output/table_1.rds

Create the output of graph1: make Output/graph1.png

make clean: Removes all contents from the output folder (tables and graphs).

## Code

All code related to the report lives in the code folder.

graph1.R: Code for creating graph1

table1.R: Code for creating table1

Render_Final_Report: Code for automatically knitting the final RMarkdown Document

## Dockerfile and Building the Image

Includes all code to build the report in a container from a docker image.

Building the image: docker build -t dtrudel17/finalproject .

## RENV

Includes all relevant files to keep R packages up to date. 



