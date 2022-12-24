.SILENT:
.PHONY: vote

help:
	{ grep --extended-regexp '^[a-zA-Z_-]+:.*#[[:space:]].*$$' $(MAKEFILE_LIST) || true; } \
	| awk 'BEGIN { FS = ":.*#[[:space:]]*" } { printf "\033[1;32m%-22s\033[0m%s\n", $$1, $$2 }'

pg: # 1) run postgres alpine docker image
	./make.sh pg

seed: # 1) seed postgres instance
	./make.sh seed

vote: # 1) run vote website using npm - dev mode
	./make.sh vote