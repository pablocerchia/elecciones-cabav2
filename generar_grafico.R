library(ggplot2)
library(dplyr)

# Crear el dataframe con los datos
datos <- data.frame(
  partido = c(
    "Unión por la Patria",
    "Vamos por más",
    "UCR / Evolución",
    "La Libertad avanza",
    "Otros",
    "Confianza Pública",
    "Movimiento de Integración y Desarrollo",
    "Izquierda Socialista-Frente de Izquierda-Unidad",
    "Frente de Izquierda de los Trabajadores / PO",
    "Compromiso Liberal Republicano",
    "PTS Frente de Izq-Unidad",
    "Partido Socialista",
    "Republicanos Unidos"
  ),
  bancas = c(18, 12, 8, 8, 3, 3, 2, 1, 1, 1, 1, 1, 1)
)

# Definir los colores específicos para cada partido
colores <- c(
  "#01b5f0",  # Unión por la Patria
  "#fcd201",  # Vamos por más
  "#ff0000",  # UCR / Evolución
  "#9e52d0",  # La Libertad avanza
  "#8f8f8f",  # Otros
  "#fa6502",  # Confianza Pública
  "#f2b90f",  # Movimiento de Integración y Desarrollo
  "#09aa64",  # Izquierda Socialista
  "#de2c35",  # Frente de Izquierda
  "#e58ade",  # Compromiso Liberal
  "#808080",  # PTS
  "#000000",  # Partido Socialista
  "#7937d4"   # Republicanos Unidos
)

# Crear el gráfico
ggplot(datos, aes(x = reorder(partido, -bancas), y = bancas, fill = partido)) +
  geom_bar(stat = "identity") +
  scale_fill_manual(values = colores) +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),
    panel.grid.major.x = element_blank(),
    panel.grid.minor.x = element_blank(),
    legend.position = "none"
  ) +
  labs(
    x = "",
    y = "Bancas",
    title = "Composición actual de la Legislatura"
  )

# Guardar el gráfico
ggsave("legislatura_composicion_actual.png", width = 12, height = 8, dpi = 300) 