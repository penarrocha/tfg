<p align="center"><a href="https://tfg.penarrocha.es" target="_blank"><img src="https://penarrocha.es/media/tfg/tfg-home.jpg" alt="Ir al website de demok"></a></p>

## Sobre el TFG

Este TFG, *Portal web de discografías y letras de canciones*, responde a la afición que quien suscribe siempre ha tenido para con la música, y en especial a las letras de canciones en inglés.

Se ha habilitado una versión de demostración en [https://tfg.penarrocha.es](https://tfg.penarrocha.es)

El acceso a la demo del proyecto está protegida con **HTTP Basic Authentication**, siendo las credenciales de acceso:
- usuario: tfg
- pwd: unir


## ¿Qué permite hacer este desarrollo?

Mostrar información sobre discografías y letras de canciones, haciendo especial hincapié en la posibilidad de que un álbum puede pertenecer a una cantidad indefinida de bandas y/o autores, almacenando toda la información disponible en una base de datos relacional.

<p align="center"><img src="https://penarrocha.es/media/tfg/tfg-album-2.jpg" alt="Información sobre un álbum con múltiples autores" /></p>

Gestionar desde el backend la información disponible, definida en los Casos de Uso. A saber: 
- **Géneros musicales**
- **Grupos musicales**
- **Álbumes**
- **Canciones (pertenecientes a un álbum)**
- **Autores que conforman un álbum**
- **Géneros musicales a los que pertenece un álbum**
- **Imágenes y videoclips asociados a los autores, álbumes y canciones**

<p align="center"><img src="https://penarrocha.es/media/tfg/tfg-song.jpg" alt="Demo de una canción"></p>

## ¿Cómo está desarrollada la aplicación?
La aplicación está construida con Laravel 11 y testada en PHP 8.3.8. Emplea una base de datos MySQL, incluida en el archivo *tfg_20240708.sql*.

<p align="center"><img src="https://penarrocha.es/media/tfg/tfg-album.jpg" alt="Información sobre un álbum" /></p>
