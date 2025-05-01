#! add a rule to build the report

Final_Project.html: Final_Project.Rmd output/table_1.rds output/graph1.png code/Render_Final_Report.R
	Rscript code/Render_Final_Report.R

.PHONY: install
install:
	Rscript -e "renv::activate()"
	Rscript -e "renv::restore(prompt = FALSE)"


#! add a rule to create the output of table1
output/table_1.rds: code/table1.R
	Rscript code/table1.R

#! add a rule to create the output of graph1
output/graph1.png: code/graph1.R
	Rscript code/graph1.R

#! add a PHONY target for removing files from output
.PHONY:clean
clean:
	rm final_report/*
	rm output/*
	
		
#! RULES TO BUILD AUTOMATICALLY IN CONTAINER	

report_m:
	docker run -v "$$(pwd)"/final_report:/home/rstudio/project/final_report dtrudel17/finalproject
	
report_w:
	docker run -v "/$$(pwd)"/final_report:/home/rstudio/project/final_report dtrudel17/finalproject
	