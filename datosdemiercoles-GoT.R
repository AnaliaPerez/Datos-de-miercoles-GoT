#Hecho por Analía Perez, para el 2do #datosdemiércoles (17/04/19) 

library(treemapify)
library(tidyverse)
library(readr)

tiempo_pantalla <- readr::read_csv("https://raw.githubusercontent.com/cienciadedatos/datos-de-miercoles/master/datos/2019/2019-04-17/tiempo_pantalla.csv")

cambio_lealtades <- readr::read_csv("https://raw.githubusercontent.com/cienciadedatos/datos-de-miercoles/master/datos/2019/2019-04-17/cambio_lealtades.csv")

personajes_libros <- readr::read_csv("https://raw.githubusercontent.com/cienciadedatos/datos-de-miercoles/master/datos/2019/2019-04-17/personajes_libro.csv")

personajes_mas_minutos<- tiempo_pantalla%>%
  filter(minutos_pantalla>85)

casas<- cambio_lealtades%>%
  select(nombre, origen)

pmm_casas<-left_join(personajes_mas_minutos, casas, by="nombre")

ggplot(pmm_casas, aes(area = minutos_pantalla, fill = episodios, subgroup=origen, label = nombre)) +
  geom_treemap() +
  geom_treemap_subgroup_border()+
  scale_fill_gradient(low = "#B55B81", high= "#48001E")+
  geom_treemap_text(fontface = "italic", colour = "white", place = "centre")+
  geom_treemap_subgroup_text(place = "bottomleft", colour = "grey", alpha = 0.5, grow = T)+
  labs(title = "Minutos de aire y cantidad de episodios de los principales personajes de GoT", subtitle = "Se representan los 15 personajes con más minutos en pantalla, agrupados por su casa de origen.", fill="Número de episodios",
       caption = "Elaborado en base a datos de la propuesta #datosdemiércoles del día 17/04/19")

#otros colores:  low = "#ED3A2B", high= "#7C0900"
#low = "#B55B81", high= "#48001E"
