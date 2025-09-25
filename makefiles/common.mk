USER := $$(whoami)
GROUP := $$(id -gn $(USER))

set-permissions:
	sudo chown -R $(USER):$(GROUP) ./; \
	sudo chmod -R 755 ./;
