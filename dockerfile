#Use base image, create a directory in the image
FROM rocker/tidyverse as base
RUN mkdir /home/rstudio/project

#create project directory
WORKDIR /home/rstudio/project

#create renv folder
run mkdir -p renv
COPY renv.lock renv.lock
COPY .Rprofile .Rprofile
COPY renv/activate.R renv/activate.R
COPY renv/settings.json renv/settings.json

#change default location of renv cahse to be in my project directory
RUN mkdir renv/.cache
ENV RENV_PATHS_CACHE renv/.cache

#run line to restore the package library
RUN R -e "renv::restore()"

###### DO NOT EDIT STAGE 1 BUILD LINES ABOVE ######

#The following lines create a second image in the same dockerfile. However, this second
#image we are simplying copying the contents of the project directory to the new image
#from the first image we created. This way, as long as we do not modify the contents
#of renv.lock we will not need to re-install the package library.

FROM rocker/tidyverse

WORKDIR /home/rstudio/project
COPY --from=base /home/rstudio/project .


ENV WHICH_CONFIG='default'

COPY Makefile .
COPY Final_Project.Rmd .

RUN mkdir code
RUN mkdir output
RUN mkdir Raw_Data
RUN mkdir final_report

COPY Raw_Data/TeenVaccineData.csv Raw_Data
COPY Code/graph1.R code
COPY Code/Render_Final_Report.R code
COPY Code/table1.R code

CMD make && mv Final_Project.html final_report



