.PHONY: help date
help:
	@echo "Usage: make [target]\n"
	@awk 'BEGIN {FS = ":.*?## "}; \
		/^# ---/ {topic = substr($$0, 5); next} \
		/^[a-zA-Z_-]+:.*?## / {print topic "###" $$1 "###" $$2}' $(MAKEFILE_LIST) | \
		sort | \
		awk 'BEGIN {FS = "###"}; \
		{if ($$1 != "") {if (topic != $$1) {if (topic != "") print ""; topic = $$1; printf "\033[35m%s\033[0m\n", topic}; printf "  \033[36m%-${HELP_SIZE}s\033[0m %s\n", $$2, $$3}}'



#################################################################################
# --- Git
#################################################################################
git_config_wsl: ## configura o git
	git config --global user.name "Fulano"
	git config --global user.email "fulano@suzano.com.br"

git_back: ## volta um commit
	git log -n 1
	git reset --soft HEAD~1

git_remote_update: ## atualiza a lista de repositórios remotos
	git remote update origin --prune

git_test: ## testa conexao ssh
	-ssh -T git@github.com

ssh_fix: ## configura o ssh
	chmod 600 /root/.ssh/id_ed25519

#################################################################################
# --- DOCKER Clear
#################################################################################
clear-i: ## remove imagens docker sem uso
	-docker rmi $(shell docker images --filter "dangling=true" -q --no-trunc) --force

clear-c: ## remove containers docker sem uso
	-docker rm $(shell docker ps -a -q)

clear-all-c: ## remove todos os containers docker
	-docker container rm $(shell docker container ls -aq)

clear-all-i: ## remove todas as imagens docker
	-docker rmi $(shell docker images -a -q) --force
	
#https://docs.docker.com/engine/reference/commandline/images/#format-the-output
clear-date-i: ## remove imagens docker por data
	docker rmi $(shell docker images "*/*/*/*:20*" --format "{{.Repository}}:{{.Tag}}") --force

clear-volume: ## remove volumes docker
# -docker volume rm $(shell docker volume ls -q)
	docker volume prune	

#################################################################################
# --- N8N dasd 
#################################################################################
n8n-encrypt: ## encripta a senha do n8n
	-docker exec agente-autonomo-analise-csv_devcontainer-n8n-1 n8n encrypt:password --password=senha123

n8n-bash: ## abre o bash do n8n
	docker exec -it agente-autonomo-analise-csv_devcontainer-n8n-1 /bin/sh	


volume-ls: ## lista os volumes docker
	docker run --rm -it -v agente-autonomo-analise-csv_devcontainer_n8n_storage:/home/node/.n8n alpine sh