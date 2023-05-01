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

# ***************************************************************************************************
# ***************************************************************************************************

# Montanto o modelo de REGRESSÃO LINEAR

# m1 recebe lm (modelo linear) variável resposta em função variável explicativa, no BD (informar onde encontrar os dados)
m1 <- lm (airq ~ vala, data = Airq)

# Alguns dados odem não ser lineares 

summary(m1)

# O p-valor indica a significancia do modelo ou variável
# Se p-valor < 0.05 a variável é significativa (existe um efeito)
# Se p-valor > 0.05 não existe o efeito esperado

# A variável "vala" não influenciou na qualidade do ar ("airq")

