FROM rocker/r-ver:4.0.2

WORKDIR /usr/local/optisel

RUN apt update \
  && apt install -y zlib1g-dev libxml2-dev \
  && rm -rf /var/lib/apt/lists/*

COPY . .

RUN Rscript -e "renv::restore()"

ENTRYPOINT ["Rscript", "/usr/local/optisel/R/run.R"]

EXPOSE 8000/tcp

