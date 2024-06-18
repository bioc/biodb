ARG VERSION=latest
FROM registry.gitlab.com/rbiodb/biodb:${VERSION}

# Create working folder
ARG dir=/package
WORKDIR $dir

# Copy package files
COPY Makefile DESCRIPTION .Rbuildignore $dir/
COPY R/ $dir/R/
COPY src/ $dir/src/
RUN rm -f $dir/src/*.o
COPY inst/ $dir/inst/
COPY tests/ $dir/tests/
COPY longtests/ $dir/longtests/
COPY vignettes/ $dir/vignettes/

# Check
ENV HOME /home/john
RUN mkdir -p "$HOME/.cache/R"
RUN ls -1d "$HOME/.cache"/* "$HOME/.cache/R"/* >fs_state_before.txt 2>/dev/null || true
RUN make check
RUN ls -1d "$HOME/.cache"/* "$HOME/.cache/R"/* >fs_state_after.txt 2>/dev/null || true
RUN diff fs_state_before.txt fs_state_after.txt
