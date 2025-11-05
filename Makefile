Lung_cancer_report.html: tables/Table_one.rds models/Model_one.rds charts/barchart1.png Lung_cancer_report.Rmd
	Rscript code/render_report.R

tables/Table_one.rds: Edited_data/Data_clean.rds code/Table1.R
	Rscript code/Table1.R

Edited_data/Data_clean.rds: Raw_data/survey_lung_cancer.csv code/Prepare_data.R
	Rscript code/Prepare_data.R
	
models/Model_one.rds:Edited_data/Data_clean.rds code/Model1.R
	Rscript code/Model1.R
	
charts/barchart1.png:Edited_data/Data_clean.rds code/Bar_chart.R
	Rscript code/Bar_chart.R

.PHONY: clean
clean:
	rm -f tables/*.rds	&& rm -f Lung_cancer_report.html && rm -f models/* && rm -f charts/*