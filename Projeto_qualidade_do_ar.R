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

# Alguns dados podem não ser lineares 

summary(m1) # Significancia do modelo
plot(airq ~ vala, data = Airq) # Gráfico da regressão linear

# O p-valor indica a significancia do modelo ou variável
# Se p-valor < 0.05 a variável é significativa (existe um efeito)
# Se p-valor > 0.05 não existe o efeito esperado

# A variável "vala" NÃO influenciou na qualidade do ar ("airq")

# A variável "coas" afeta a variável "airq"? 

m2 <- lm (airq ~ coas, data = Airq) # Utilizando uma variável categórica
summary(m2) # Significancia do modelo

# SIM! A posição da costeira da cidade influencia na qualidade do ar

plot(airq ~ coas, data = Airq)
# As cidades costeiras apresentam uma melhor qualidade do ar

# A variável "medi" afeta a qualidade do ar?
m3 <- lm (airq ~ medi, data = Airq)
summary(m3)
plot(airq ~ medi, data = Airq)
# A variável NÃO afetou a qualidade do ar

# A quantidade de chuva influencia na qualidade do ar? 
m4 <- lm (airq ~ rain, data =  Airq)
summary(m4)
plot(airq ~ rain, data = Airq)
# A quantidade NÃO influencia na qualidade do ar

# A densidade populacional influencia na qualidade do ar? 
m5 <- lm(airq ~ dens, data = Airq)
summary(m5)
plot(airq ~ dens, data = Airq)
# A densidade NÃO influencia na qualidade do ar

# *** Retas de modelos não significativos são OPCIONAIS nos gráficos ***
# Retas nos gráficos:
plot(airq ~ medi, data = Airq)

# y = a+b*x 
# a = Intercepto (onde a reta vai tocar no eixo y)
# b = É a inclinação da reta
# add = Adicionando a reta no mesmo gráfico

summary(m3) # Coletando o intercepto e a inclinação
curve(9.936e+01+5.638e-04*x, add=TRUE)

# Melhorando os gráficos

# curve   = É a reta, um comando que realiza retas e curvas
# xlab    = Renomeando o eixo x
# ylab    = Renomeando o eixo y
# pch     = Caracteres dos pontos
# col     = Cor 
# cex.lab = Modifica o tamanho do eixo (< ou >)
# main    = Título do gráfico
#lwd      = Largura da linha
#lty      = Espessura da linha
#ylim     = Seleciona os limites do gráfico

plot(airq ~ medi, data = Airq, xlab= "Renda média per capita", 
                               ylab= "Qualidade do ar", pch = 8,
                               col = "#f31087", cex.lab = 1.5, 
                               main = "Renda média - 2010")

curve(9.936e+01+5.638e-04*x, add=TRUE, col = "#ff6347", lwd = 2, lty =2)

# Modelo m1
plot(airq ~ vala, data = Airq, xlab = "Valor das empresas ($)",
                               ylab = "Qualidade do ar", col = "darkblue",
                               pch = 1, cex.lab = 1.5)
summary(m1)
curve(96.451419+0.001969*x, add=TRUE, col = "red", lwd = 2, lty = 1)

# Modificando o boxplot 
plot(airq ~ coas, data= Airq, xlab = "Posição costeira", 
                              ylab = "Qualidade do ar", col = "#ff6f9c",
                              ylim = c(50,170), cex.lab = 1.3,
                              main = "Análise da qualidade do ar")

# ***************************************************************************************************
# ***************************************************************************************************
# Termos:
# Anova = Variável contínua ~ uma variável categórica 
#(compara variâncias entre as medianas de diferentes variáveis)
# Regressão = Variável continua ~ variável contínua
# Regressão multipla = variável contínua ~ variáveis contínuas ou não

# Regressão multipla
mRM1 <- lm(airq ~ vala + coas, data = Airq)
summary(mRM1)

# Existe um efeito da posição costeira e do valor das empresas na
# qualidade do ar
