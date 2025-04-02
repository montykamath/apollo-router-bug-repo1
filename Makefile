
.DEFAULT: supergraph

.PHONY: supergraph
supergraph: ./supergraph.graphqls

./supergraph.graphqls: schema/*.graphqls ./rover.yaml
	APOLLO_TELEMETRY_DISABLED=1 ./rover supergraph compose --skip-update-check --config ./rover.yaml --elv2-license=accept > $@

.PHONY: run
run: ./supergraph.graphqls
	APOLLO_TELEMETRY_DISABLED=true ./router --dev --supergraph ./supergraph.graphqls --config router.yaml
