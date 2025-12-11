FROM rocker/tidyverse:4.5.1

WORKDIR /project

RUN apt-get update && apt-get install -y \
    libxml2-dev \
    libcurl4-openssl-dev \
    libssl-dev \
    cmake \
    && rm -rf /var/lib/apt/lists/*

COPY . .

RUN R -e "install.packages(c('rmarkdown','here','broom','car','parameters','gtsummary','broom.helpers','janitor','kableExtra'), repos='https://cloud.r-project.org', dependencies=NA)"

CMD ["Rscript", "-e", "rmarkdown::render('Lung_cancer_report.Rmd', output_file='output/Lung_cancer_report.html')"]
