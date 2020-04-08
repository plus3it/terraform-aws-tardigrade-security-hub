FROM plus3it/tardigrade-ci:0.0.16

WORKDIR /ci-harness
ENTRYPOINT ["make"]
