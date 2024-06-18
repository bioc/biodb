# vi: ft=dockerfile
ARG VERSION=latest
ARG IMAGE=r-base
FROM ${IMAGE}:${VERSION}

# Debian
RUN if command -v apt-get ; then apt-get update && apt-get install -y qpdf tidy \
    texlive-base texlive-latex-base texinfo \
    texlive-fonts-recommended texlive-fonts-extra libfontconfig1-dev \
    texlive-latex-recommended libssl-dev \
    libcurl4-openssl-dev libxml2-dev pandoc libgit2-dev ; fi

# Archlinux
RUN if command -v pacman ; then pacman --noconfirm -Syu make r texlive-bin \
    gcc diffutils pandoc-cli qpdf tidy texinfo texlive-latexrecommended \
    texlive-fontsextra texlive-fontsrecommended ; fi

# Install R packages
RUN R --slave --no-restore -e "install.packages(c( \
    'R6', \
    'RSQLite', \
    'Rcpp', \
    'XML', \
    'chk', \
    'git2r', \
    'fscache', \
    'jsonlite', \
    'lgr', \
    'lifecycle', \
    'methods', \
    'openssl', \
    'plyr', \
    'progress', \
    'rappdirs', \
    'sched', \
    'stats', \
    'stringr', \
    'tools', \
    'withr', \
    'yaml', \
    'roxygen2', \
    'devtools', \
    'testthat', \
    'knitr', \
    'rmarkdown', \
    'covr', \
    'xml2' \
    ), dependencies=TRUE, repos='https://cloud.r-project.org/') ; \
    if (!requireNamespace('BiocManager', quietly = TRUE)) \
    install.packages('BiocManager') ; BiocManager::install('BiocStyle')"
