# Instalando pacotes ------------------------------------------------------
install.packages("dplyr")
install.packages("tidyverse")
install.packages("lubridate")
remotes::install_github("williamorim/brasileirao")

# Carregando pacotes ------------------------------------------------------
library(dplyr)
library(tidyverse)
library(lubridate)
library(brasileirao)

# Manipulando os dados ----------------------------------------------------
head(brasileirao::matches)

tab_resul_mandante <- brasileirao::matches %>% 
  dplyr::filter(season <= 2020) %>% 
  separate(
    score, 
    c("home_score", "away_score"), 
    sep = "x", 
    convert = TRUE
  ) %>% 
  mutate(
    home_win = home_score > away_score,
    result = case_when(
      home_score > away_score ~ "Vitória do mandante",
      home_score == away_score ~ "Empate",
      home_score < away_score ~ "Derrota do mandante"
    ),
    pontos = case_when(
      home_score > away_score ~ 3,
      home_score == away_score ~ 1,
      home_score < away_score ~ 0
    ),
    torcida = ifelse(season == 2020, "sem_torcida", "com_torcida")
  ) 

# Plot 1 ------------------------------------------------------------------
tab_grafico <- tab_resul_mandante %>% 
  count(season, torcida, result) %>% 
  group_by(season, torcida) %>% 
  mutate(prop = n/sum(n)) %>% 
  ungroup() 

tab_grafico %>% 
  ggplot(aes(x = season, y = prop, fill = result)) +
  geom_col(aes(colour = torcida), position = "stack") +
  geom_hline(yintercept = .5, linetype = 2, colour = 2, size = 1) +
  geom_label(
    aes(label = scales::percent(prop, accuracy = 1), y = prop / 2),
    size = 3,
    color = "white",
    data = filter(tab_grafico, result == "Vitória do mandante")
  ) +
  theme_minimal(14) +
  scale_colour_manual(values = c("transparent", "black")) +
  guides(colour = "none") +
  theme(
    legend.position = "bottom",
    plot.title = element_text(hjust = 0.5),
    plot.subtitle = element_text(hjust = 0.5),
    legend.text = element_text(size = 10)
  ) +
  scale_fill_viridis_d(begin = .8, end = .2) +
  scale_y_continuous(labels = scales::percent) +
  labs(
    title = "Desempenho dos mandantes por temporada",
    x = "Temporada",
    y = "Proporção",
    fill = ""
  )

# Plot 2 ------------------------------------------------------------------
tab_resul_mandante %>% 
  filter(season >= 2006) %>% 
  group_by(season) %>% 
  summarise(total_pontos = sum(pontos)) %>% 
  ggplot(aes(x = season, y = total_pontos)) +
  geom_line(color = viridis::viridis(1, begin = 0.2)) +
  geom_label(aes(label = total_pontos), color = viridis::viridis(1, begin = 0.2)) +
  theme_minimal(14) +
  labs(
    x = "Temporada",
    y = "Número de pontos do mandante"
  )

# Tabela ------------------------------------------------------------------
library(reactable)

tab_resul_mandante %>% 
  filter(season %in% c(2017:2020)) %>% 
  mutate(home = brasileirao::fix_names(home)) %>% 
  group_by(season, torcida, home) %>% 
  summarise(total_pontos = sum(pontos)) %>% 
  group_by(torcida, home) %>% 
  summarise(media_pontos = mean(total_pontos)) %>% 
  ungroup() %>%
  pivot_wider(
    id_cols = home,
    names_from = torcida, 
    values_from = media_pontos,
    names_prefix = "pts_"
  ) %>%
  filter(!is.na(pts_sem_torcida)) %>% 
  mutate(
    diferenca_rel = (pts_sem_torcida - pts_com_torcida) / pts_com_torcida
  ) %>% 
  arrange(desc(diferenca_rel)) %>% 
  mutate(
    pts_com_torcida = round(pts_com_torcida, 1),
    diferenca_rel = scales::percent(diferenca_rel, accuracy = 0.1)
  ) %>% 
  reactable(
    pagination = FALSE,
    compact = TRUE,
    style = "margin-bottom: 1px;",
    columns = list(
                    home = colDef(
                      name = "Time"
                    ),
                    pts_com_torcida = colDef(
                      name = "Média últimas 3 temporadas",
                      na = "—",
                      align = "center"
                    ),
                    pts_sem_torcida = colDef(
                      name = "Pontos como mandante em 2020",
                      align = "center"
                    ),
                    diferenca_rel = colDef(
                      name = "Diferença percentual",
                      na = "—",
                      align = "center"
                    )
                  )
  )
