library(ggplot2)
library(dplyr)

# Crear coordenadas para 60 puntos en un semicírculo
n_puntos <- 60
radio <- 1
angulo <- seq(0, pi, length.out = n_puntos)

# Crear dataframe con las coordenadas
df <- data.frame(
  x = radio * cos(angulo),
  y = radio * sin(angulo),
  id = 1:n_puntos
)

# Crear el gráfico
hemiciclo <- ggplot(df, aes(x = x, y = y)) +
  geom_point(size = 8, color = "#2F4F4F", shape = 21, fill = "white", stroke = 1.5) +
  coord_fixed() +  # Mantener proporción 1:1
  theme_void() +   # Eliminar ejes y fondo
  theme(
    plot.background = element_rect(fill = "transparent", color = NA),
    panel.background = element_rect(fill = "transparent", color = NA)
  ) +
  xlim(c(-1.2, 1.2)) +
  ylim(c(-0.2, 1.2))

# Guardar el gráfico
ggsave("closeread/images/hemiciclo.png", 
       hemiciclo, 
       width = 8, 
       height = 5, 
       bg = "transparent") 