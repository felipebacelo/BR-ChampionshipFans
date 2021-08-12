<p align="center">
<a href= "https://img.shields.io/github/repo-size/felipebacelo/BR-ChampionshipFans?style=for-the-badge"><img src="https://img.shields.io/github/repo-size/felipebacelo/BR-ChampionshipFans?style=for-the-badge"/></a>
<a href= "https://img.shields.io/github/languages/count/felipebacelo/BR-ChampionshipFans?style=for-the-badge"><img src="https://img.shields.io/github/languages/count/felipebacelo/BR-ChampionshipFans?style=for-the-badge"/></a>
<a href= "https://img.shields.io/github/forks/felipebacelo/BR-ChampionshipFans?style=for-the-badge"><img src="https://img.shields.io/github/forks/felipebacelo/BR-ChampionshipFans?style=for-the-badge"/></a>
<a href= "https://img.shields.io/bitbucket/pr-raw/felipebacelo/BR-ChampionshipFans?style=for-the-badge"><img src="https://img.shields.io/bitbucket/pr-raw/felipebacelo/BR-ChampionshipFans?style=for-the-badge"/></a>
<a href= "https://img.shields.io/bitbucket/issues/felipebacelo/BR-ChampionshipFans?style=for-the-badge"><img src="https://img.shields.io/bitbucket/issues/felipebacelo/BR-ChampionshipFans?style=for-the-badge"/></a>
</p>

# Análise do Campeonato Brasileiro

## Objetivo ##

<p>Contribuir com um trabalho analítico extraindo informações e storytelling baseados em dados para insights bem como, uma forma de desenvolver e consolidar meus conhecimentos no campo da análise de dados desenvolvendo uma análise descritiva com o uso da linguagem de programação R através da IDE RStudio.</p>
<p>Essa análise tem por objetivo principal, verificar através dos dados se a ausência de torcida nos jogos de futebol causada pela pandemia tem algum efeito no desempenho dos times mandantes.</p>

## Origem dos Dados ##

<p>Os dados utilizados na análise estão no pacote <strong>{brasileirao}</strong>. O pacote está disponível neste <a href="https://github.com/williamorim/brasileirao">repositório</a>.</p>

## Instalação das Ferramentas ##
  
  - [R - 4.1.0](https://www.r-project.org/)
  - [RSudio - 1.4.1725](https://rstudio.com/)

## Desenvolvimento ##

### Leitura da Base ###

<p>Para realizar a leitura da base de dados basta instalar e carregar o pacote <strong>{brasileirao}</strong>.</p>
<p>A base de dados está em formato <strong>tibble</strong> e contém 5 colunas:</p>

* A coluna <strong>Season</strong> contém informação do ano da partida.
* A coluna <strong>Date</strong> contém informação do ano, mês e dia da partida.
* A coluna <strong>Home</strong> contém informação do time mandante.
* A coluna <strong>Score</strong> contém informação do resultado da partida.
* A coluna <strong>Away</strong> contém informação do time visitante.

### Manipulação dos Dados ###

<p>Através da manipulação dos dados da base original conseguimos gerar mais informações necessárias, criando algumas colunas com base nas existentes.</p>
<p>A partir da coluna <strong>score</strong>, que tem seus valores no estilo gols_mandante x gols_visitante, construímos as seguintes variáveis de interesse:</p>

* result: que indica se o resultado foi vitória do mandante, empate ou derrota do mandante;
* pontos: que indica o número de pontos feitos pelo mandante na partida.

<p>Também criamos a variável <strong>torcida</strong>, que indica como sem_torcida a temporada de 2020 e como com_torcida as demais.</p>

### Visualizações ###

<p>Inicialmente, verificamos a proporção de vitórias dos mandantes, comparando a temporada de 2020 com as demais. O gráfico abaixo mostra a proporção de vitórias, empates e derrotas dos mandantes em cada temporada. Podemos perceber que a proporção de vitórias dos mandantes no Brasileirão de pontos corridos varia de 44% a 55%. A temporada de 2020, com 45%, foi a temporada com a segunda menor proporção de vitórias dos mandantes, perdendo apenas para 2017 com 44%.</p>
<p align="center">
<img src="https://github.com/felipebacelo/BR-ChampionshipFans/blob/main/IMAGES/PLOT-1.png"/></p>
<p>Podemos também olhar diretamente a quantidade de pontos somados pelos mandantes em cada temporada. O gráfico a seguir mostra que o número de pontos por temporada tende a permanecer entre 650 e 700, com algumas exceções para mais e para menos. Novamente, 2020 foi a temporada com o segundo menor número de pontos feitos pelos mandantes (621, contra 604 da temporada 2017).</p>
<p align="center">
<img src="https://github.com/felipebacelo/BR-ChampionshipFans/blob/main/IMAGES/PLOT-2.png"/></p>
<p>Por fim, podemos investigar o efeito para cada time. A tabela a seguir mostra o número de pontos como mandante conquistados por cada time na temporada de 2020 contra a média de pontos como mandante nas últimas 3 temporadas (2017, 2018 e 2019).</p>
<p align="center">
<img src="https://github.com/felipebacelo/BR-ChampionshipFans/blob/main/IMAGES/PLOT-3.png"/></p>

## Referências ##
  
* [Curso-R](https://curso-r.com/)
* [R para Data Science](https://curso-r.com/)

## Licenças ##

_MIT License_
_Copyright   ©   2021 Felipe Bacelo Rodrigues_
