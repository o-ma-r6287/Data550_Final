Lung_cancer_report.html: tables/Table_one.rds Lung_cancer_report.Rmd
	Rscript code/render_report.R

tables/Table_one.rds: Edited_data/Data_clean.rds code/Table1.R
	Rscript code/Table1.R

Edited_data/Data_clean.rds: Raw_data/survey_lung_cancer.csv code/Prepare_data.R
	Rscript code/Prepare_data.R

.PHONY: clean
clean:
	rm -f tables/*.rds	&& rm -f Lung_cancer_report.html