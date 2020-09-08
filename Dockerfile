FROM rocker/r-ver:4.0.2

WORKDIR /usr/local/optisel

RUN apt update \
  && apt install -y --no-install-recommends \
  xvfb \
  libpq-dev \
  libx11-dev \
  pkg-config \
  libglu1-mesa-dev \
  zlib1g-dev \
  libxml2-dev \
  && rm -rf /var/lib/apt/lists/*

COPY . .

RUN Rscript -e 'install.packages(c("here","RPostgres","optiSel","plumber","jsonlite","readxl","anytime"))'

ENTRYPOINT ["Rscript", "/usr/local/optisel/R/run.R"]

