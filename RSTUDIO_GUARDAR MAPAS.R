rm(list = ls())

# 1. SELECCIONAR EL ARCHIVO .GPKG
gpklink = file.choose()

# 2. CARGAR LIBRERÍAS
library(sf)
library(ggplot2)

# 3. CARGAR CAPAS ESPACIALES DESDE EL GEOPACKAGE
lisa_rook_sf   = read_sf(gpklink, layer = "lisa_rook")
lisa_knn5_sf   = read_sf(gpklink, layer = "lisa_knn5")
lisa_dband_sf  = read_sf(gpklink, layer = "lisa_dband20k")
lisa_kernel_sf = read_sf(gpklink, layer = "lisa_kernel")

# 4. PALETA DE COLORES ESTÁNDAR PARA MAPAS LISA
colores_lisa = c(
  "No Significativo"  = "#e2e8f0",
  "Hot-Spot (HH)"     = "#dc2626",
  "Cold-Spot (LL)"    = "#2563eb",
  "Cold-Outlier (LH)" = "#7dd3fc",
  "Hot-Outlier (HL)"  = "#f472b6"
)

# =================================================================
# MAPA 1: Frontera Física (Rook)
# =================================================================
map1gg = ggplot() + 
  theme_void() + 
  geom_sf(data = lisa_rook_sf, aes(fill = lisa_type), color = 'white', linewidth = 0.1) +
  scale_fill_manual(name = "Tipo de Cluster", values = colores_lisa, drop = FALSE) +
  labs(title = "Análisis LISA: Contigüidad Torre (Rook)") +
  theme(legend.position = "right")

print(map1gg)                 # Muestra el mapa en la pantalla de RStudio
saveRDS(map1gg, file='MAPA1.rds') # Guarda el archivo físico

# =================================================================
# MAPA 2: K-Vecinos Cercanos (K=5)
# =================================================================
map2gg = ggplot() + 
  theme_void() + 
  geom_sf(data = lisa_knn5_sf, aes(fill = lisa_type), color = 'white', linewidth = 0.1) +
  scale_fill_manual(name = "Tipo de Cluster", values = colores_lisa, drop = FALSE) +
  labs(title = "Análisis LISA: K-Vecinos Más Cercanos (K=5)") +
  theme(legend.position = "right")

print(map2gg)                 # Muestra el mapa en la pantalla de RStudio
saveRDS(map2gg, file='MAPA2.rds') # Guarda el archivo físico

# =================================================================
# MAPA 3: Banda de Distancia (20 km)
# =================================================================
map3gg = ggplot() + 
  theme_void() + 
  geom_sf(data = lisa_dband_sf, aes(fill = lisa_type), color = 'white', linewidth = 0.1) +
  scale_fill_manual(name = "Tipo de Cluster", values = colores_lisa, drop = FALSE) +
  labs(title = "Análisis LISA: Banda de Distancia Fija (20km)") +
  theme(legend.position = "right")

print(map3gg)                 # Muestra el mapa en la pantalla de RStudio
saveRDS(map3gg, file='MAPA3.rds') # Guarda el archivo físico

# =================================================================
# MAPA 4: Relación Continua (Kernel)
# =================================================================
map4gg = ggplot() + 
  theme_void() + 
  geom_sf(data = lisa_kernel_sf, aes(fill = lisa_type), color = 'white', linewidth = 0.1) +
  scale_fill_manual(name = "Tipo de Cluster", values = colores_lisa, drop = FALSE) +
  labs(title = "Análisis LISA: Ponderación Continua (Kernel)") +
  theme(legend.position = "right")

print(map4gg)                 # Muestra el mapa en la pantalla de RStudio
saveRDS(map4gg, file='MAPA4.rds') # Guarda el archivo físico