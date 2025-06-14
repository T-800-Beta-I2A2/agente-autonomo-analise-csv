FROM mcr.microsoft.com/devcontainers/base:jammy

RUN apt update

WORKDIR /workspace

# # Install doctl - https://docs.digitalocean.com/reference/doctl/how-to/install/
# RUN echo "Installing doctl..." && \
#     wget https://github.com/digitalocean/doctl/releases/download/v1.123.0/doctl-1.123.0-linux-amd64.tar.gz && \
#     tar xf doctl-1.123.0-linux-amd64.tar.gz && \
#     mv doctl /usr/local/bin && \
#     rm -rf doctl*.*


# #####       # Install Terraform
# #####       RUN wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
# #####       RUN echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list
# #####       RUN apt-get update && apt-get install -y \
# #####           terraform \
# #####           direnv \
# #####           && rm -rf /var/lib/apt/lists/*
# ####
# #####       # Instala o Docker CLI - DinD
# #####       RUN echo "Installing Docker CLI..." && \
# #####           apt-get update && apt-get install -y \
# #####           docker.io \
# #####           && rm -rf /var/lib/apt/lists/*
    
    
# # Instala o suporte postgres - psql client + linter XML
# RUN echo "Instala o psql..." && \
# apt update && \
# apt install postgresql-client libxml2-utils -y
    
    
# # Cria um usuário não root (vscode) e permite sudo sem senha
# RUN echo "vscode ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# # Define o usuário padrão
# USER vscode
    
# ######          # Instala o poetry
# ######          RUN echo "Installing Poetry..." && \
# ######              curl -sSL https://install.python-poetry.org | python3 - 
# ######          ENV POETRY_NO_INTERACTION=1 \
# ######              POETRY_VIRTUALENVS_IN_PROJECT=1 \
# ######              POETRY_VIRTUALENVS_CREATE=1 \
# ######              POETRY_CACHE_DIR=/tmp/poetry_cache\
# ######              POETRY_VIRUTALENV_PATH=.venv
    


# # CMD ["tail", "-f", "/dev/null"]
CMD ["sleep", "infinity"]