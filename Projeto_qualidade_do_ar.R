# PROJETO DO CURSO: "O que afeta a qualidade do ar e como é afetado?"
# Autor: Danna SES


# Install packages Ecdat - Para extrair informações do banco de dados
# install.packages(Ecdat) 

library(Ecdat) # Carregando o pacote

data("Airq")   # Buscando o banco de dados disponível no pacote

names(Airq)    # Exibe o nome das variáveis

# VARIÁVEL RESPOSTA
# Airq: Indice da qualidade do ar (< melhor)

# VARIAVEIS EXPLICATIVAS (explica a variação da variável RESPOSTA)
# Vala: Valor das empresas nas cidades (em milhares de dólares)
# rain: Quantidade de chuva em polegadas
# Coas: Posição costeira da cidade (Y/N)
# Dens: Densidade populacional (milha quadrada)
# Medi: Renda média per capita (dólares)

# Análise descritiva ou exploratória

summary(Airq) # Sumário das variáveis 
# As variáveis podem ser contínuas ou categóricas 

# Gerando um gráfico simples
plot(airq~vala, data=Airq) # Variável resposta EM FUNÇÃO DE variável explicativa, no banco de dados

# Criando um modelo estatístico 
# y (resposta) ~ (em função) x (explicativa)

# Para trabalhar com outras variáveis no nosso modelo, utilizamos o "+"
# y (crescimento da planta) ~ x (adubo) + x (quantidade de luz)
# y ~ x1 + x2 + x3
# airq ~ vala + coas + rain
