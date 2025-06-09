# Usa uma imagem base do Python
FROM python:3.10-slim

# Define o diretório de trabalho dentro do container
WORKDIR /app

# Copia o arquivo de dependências para dentro do container (para garantir que o Docker tenha as dependências do projeto)
COPY requirements.txt .

# Copia o ambiente virtual existente para o container
COPY projeto-walmart /app/projeto-walmart

# Define o caminho do ambiente virtual como padrão dentro do container
ENV PATH="/app/projeto-walmart/bin:$PATH"

# Instala o Jupyter Lab (caso não esteja no requirements.txt)
RUN pip install --no-cache-dir jupyterlab

# Copia os arquivos do projeto para o diretório de trabalho no container
COPY . .

# Exponha a porta que o Jupyter Lab usará
EXPOSE 8888

# Comando padrão ao rodar o container para iniciar o Jupyter Lab
CMD ["jupyter", "lab", "--ip='0.0.0.0'", "--port=8888", "--no-browser", "--allow-root"]