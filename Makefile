PACKAGE=$(subst Package: ,,$(shell grep ^Package: DESCRIPTION))
VERSION=$(subst Version: ,,$(shell grep ^Version: DESCRIPTION))
RFLAGS=--slave --no-restore
PKG_FILE=$(PACKAGE)_$(VERSION).tar.gz
R=R $(RFLAGS)
R_VERSIONS=4.1.2 4.2.3 latest

export BIODB_CACHE_DIRECTORY=$(CURDIR)/cache

all:

build: NAMESPACE
	$(R) CMD build .

$(PKG_FILE): build

check: $(PKG_FILE)
	$(R) CMD check --as-cran "$<"

NAMESPACE: doc

doc:
	$(R) -e "roxygen2::roxygenise()"

install: $(PKG_FILE)
	$(R) CMD INSTALL $(PKG_FILE)

test:
	$(R) -e "testthat::test_local()"

install.deps:
	R -e "if (!requireNamespace('devtools')) install.packages('devtools') ; devtools::install_dev_deps('.') ; BiocManager::install('BiocStyle')"

dockers: $(addprefix docker_,$(R_VERSIONS))

docker_%:
	docker buildx build --progress plain --build-arg "VERSION=$(patsubst docker_%,%,$@)" -t "biodb:$(patsubst docker_%,%,$@)" .

base_dockers: $(addprefix base_docker_,$(R_VERSIONS))

base_docker_%:
	docker buildx build --progress plain -f base_docker.dockerfile --build-arg "VERSION=$(patsubst base_docker_%,%,$@)" -t "registry.gitlab.com/rbiodb/biodb:$(patsubst base_docker_%,%,$@)" .

push_base_dockers: $(addprefix push_base_docker_,$(R_VERSIONS))

push_base_docker_%:
	docker push "registry.gitlab.com/rbiodb/biodb:$(patsubst push_base_docker_%,%,$@)"

cov:
	./compute_coverage

clean:
	$(RM) *.tar.gz *.log src/*.o src/*.so
	$(RM) -r man *.Rcheck cache tests/testthat/output

.PHONY: all clean check doc install test
