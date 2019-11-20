**66.48 SEMINARIO DE SISTEMAS EMBEBIDOS - FIUBA**

- Darío Capucchio 85119
- Cristian García 89040

# workspace-EDU_CIAA_NXP_TP3

LPC43xx Entradas y Salidas (Digitales) de Propósito General (GPIO) - FreeRTOS

# Objetivo
- Uso del IDE
- Uso de GPIO & FreeRTOS
- Documentación

# Contenidos
- [1 Uso del IDE](#1-Uso-del-IDE)
- [2 free rtos examples 1 a 9](#2-free-rtos-examples-1-a-9)
- [3 free rtos examples 10 a 16](#3-free-rtos-examples-10-a-16)
- [4 Implementacion 1](#4-Implementacion-1)
- [5 Implementacion 2](#5-Implementacion-2)
- [6 Implementacion 3](#6-Implementacion-3)
- [7 Hoja de ruta](#7-hoja-de-ruta)


# 1 Uso del IDE

Utilizando el IDE LPCXpresso IDE v8.2.0 se creo el workspace "workspace-EDU_CIAA_NXP_TP3"  como se muestra en la figura:

![Imagen 00_workspace.png](https://raw.githubusercontent.com/cristianlabo/TP3/master/Imagenes/00_workspace.png)

Luego se importo el proyecto LPCXpresso-FreeRTOS-Examples.zip y se configuro el DEBUG como se muestra en la figura:

![debug1.png](https://raw.githubusercontent.com/cristianlabo/TP3/master/Imagenes/debug1.png)
![debug2.png](https://raw.githubusercontent.com/cristianlabo/TP3/master/Imagenes/debug2.png)


Luego desde el archivo freertos_examples_1_to_9/example/freertos_examples_1_to_9.c se configuro el example 1 como se ve en la siguiente figura:

![definiciones.png](https://raw.githubusercontent.com/cristianlabo/TP3/master/Imagenes/definiciones.png)
![definiciones2.png](https://raw.githubusercontent.com/cristianlabo/TP3/master/Imagenes/definiciones2.png)

Se pueden visualizar en la siguiente figura las funciones:


| Nombre | Descripción |
| ------ | ----------- |
| Board_LED_Set(LED3, LED_ON);| enciende le led 3   |
|  DEBUGOUT(pcTaskName);  | muestra por el usart el mensaje  guardado en pcTaskName |
|  prvSetupHardware();  | setea las variables del sistema   |
|  xTaskCreate(vTask2, (char *) "Task2", configMINIMAL_STACK_SIZE,NULL, (tskIDLE_PRIORITY + 1UL), (xTaskHandle *) NULL);|crea la tarea2|
| vTaskStartScheduler(); | activa el manejador de tareas |


![funciones1.png](https://raw.githubusercontent.com/cristianlabo/TP3/master/Imagenes/funciones1.png)
![funciones2.png](https://raw.githubusercontent.com/cristianlabo/TP3/master/Imagenes/funciones2.png)

Se pueden visualizar en la siguiente figura las constantes:

| Nombre | Descripción |
| ------ | ----------- |
| LED3   |  constante que indica la posicion fisica dl pin del led 3  |
|  LED_ON  | constante que indica el estado encendido de un led   |
|  *pcTaskName   |  cadena de texto usada para guardar el nombre de la tarea  |
|  ul |  variable de iteracion volatile  |
|  mainDELAY_LOOP_COUNT |  constante utilizada para indicar el maximo de delay de la tarea  |
|  configMINIMAL_STACK_SIZE |  constante que indica el minimo de espacion en memoria de stack  |
| tskIDLE_PRIORITY + 1UL|  constante que indica la prioridad de la tarea  |


![constantes1.png](https://raw.githubusercontent.com/cristianlabo/TP3/master/Imagenes/constantes2.png)
![constantes1.png](https://raw.githubusercontent.com/cristianlabo/TP3/master/Imagenes/constantes2.png)



# 2 free rtos examples 1 a 9


## Example 1 Creating tasks

En la siguiente figura se puede ver el diagrama temporal de la distribución del tiempo de CPU entre tareas, Kernel,
Interrupciones:

![task1.png](https://raw.githubusercontent.com/cristianlabo/TP3/master/esquemas/task1.png)

Se puede  configurar el time slice desde freertos_examples_1_to_9/example/inc/FreeRTOSConfig.h como se puede ver en la figura:

![Imagen 01_configh.png](https://raw.githubusercontent.com/cristianlabo/TP3/master/Imagenes/01_configh.png)

Modificando el valor de este parametro para los diferentes casos (1000mS/100mS/10mS/1mS) se obtuvo que cuanto menor sea este valor las tareas manejadas por el Scheduler iran iterando cada vez mas rapido debido a que tienen la misma prioridad.
Este parametro permite que las tareas programadas terminen en su totalidad si estas son de menor tiempo que este parametro.
Se puede observar que las tareas se interrumpen debido a que tienen el mismo nivel de prioridad.En la siguiente figura se puede ver como las tareas no llegan a terminar de imprimir el mensaje por el usart si el perido de interrupcion es demasiado corto( f=1000 Hz => T=1ms):

![observacion_tarea1.png](https://raw.githubusercontent.com/cristianlabo/TP3/master/Imagenes/observacion_tarea1.png)

## Example 2 Using the task parameter

En la siguiente figura se puede ver el diagrama temporal de la distribución del tiempo de CPU entre tareas, Kernel,
Interrupciones:

![task1.png](https://raw.githubusercontent.com/cristianlabo/TP3/master/esquemas/task1.png)

Se puede  configurar el time slice desde freertos_examples_1_to_9/example/inc/FreeRTOSConfig.h como se mostro en ejemplo anterior.
La diferencia primordial respecto del ejemplo anterior es que las tareas estan creadas con parametros distintos.
En este caso la funcion toggle permite que cambie de estado el led provocando que se visualice un parpadeo intermitente cuanto mayor sea la frecuencia de interrupcion de cada tarea.
Se puede observar que las tareas se interrumpen debido a que tienen el mismo nivel de prioridad.En la siguiente figura se puede ver como las tareas no llegan a terminar de imprimir el mensaje por el usart si el perido de interrupcion es demasiado corto( f=1000 Hz => T=1ms).:

![observacion_tarea1.png](https://raw.githubusercontent.com/cristianlabo/TP3/master/Imagenes/observacion_tarea1.png)

# 3 free rtos examples 10 a 16

## Example 11 Blocking when sending to a queue or sending structures on a queue 

En la siguiente figura se puede ver el diagrama temporal de la distribución del tiempo de CPU entre tareas, Kernel,
Interrupciones:

![Esquema_ej11.png](https://raw.githubusercontent.com/cristianlabo/TP3/master/esquemas/Esquema_ej11.png)

Se puede observar que las tareas se interrumpen debido a que tienen el mismo nivel de prioridad.En la siguiente figura se puede ver como las tareas no llegan a terminar de imprimir el mensaje por el usart si el perido de interrupcion es demasiado corto( f=1000 Hz => T=1ms):

![tarea11.png](https://raw.githubusercontent.com/cristianlabo/TP3/master/Imagenes/tarea11.png)

## Example 13 Using a counting semaphore to synchronize a task with an interrupt

En la siguiente figura se puede ver el diagrama temporal de la distribución del tiempo de CPU entre tareas, Kernel,
Interrupciones:

![Esquema_ej13.png](https://raw.githubusercontent.com/cristianlabo/TP3/master/esquemas/Esquema_ej13.png)

La tarea 1 se repite periodicamente a través de un vTaskDelay y llama a la interrupción, que entrega el semáforo 3 veces. La tarea 3 se ejecuta 3 veces seguidas, hasta que toma los tres semáforos.

# 4 Implementacion 1

En la siguiente figura se puede ver el diagrama temporal de la distribución del tiempo de CPU entre tareas, Kernel,
Interrupciones:

![grafico_implementacion1.png](https://raw.githubusercontent.com/cristianlabo/TP3/master/Imagenes/grafico_implementacion1.png)

Se puede observar que la tarea 2 (prioridad 3) carga un dato en la cola y toma el semaforo para bloquearse,luego toma el control del cpu la tarea 3(prioridad 2) la cual saca el dato de la cola y se bloquea cuando vacia la cola, despues toma el control de la cpu la tarea 1(prioridad 1) la cual espera un delay bloqueada y genera una interrupcion que libera el semaforo para que tome el control la tarea 2 y repetir el ciclo.

El codigo main de la implemetacion se puede ver en la siguiente figura:

![main_implementacion1_1.png](https://raw.githubusercontent.com/cristianlabo/TP3/master/Imagenes/main_implementacion1_1.png)

![main_implementacion1_2.png](https://raw.githubusercontent.com/cristianlabo/TP3/master/Imagenes/main_implementacion1_2.png)

Las funciones y tareas utilizadas son las siguientes:

![definicion_funciones_implementacion1_1.png](https://raw.githubusercontent.com/cristianlabo/TP3/master/Imagenes/definicion_funciones_implementacion1_1.png)

![definicion_funciones_implementacion1_2.png](https://raw.githubusercontent.com/cristianlabo/TP3/master/Imagenes/definicion_funciones_implementacion1_2.png)

![definicion_funciones_implementacion1_3.png](https://raw.githubusercontent.com/cristianlabo/TP3/master/Imagenes/definicion_funciones_implementacion1_3.png)

![definicion_funciones_implementacion1_4.png](https://raw.githubusercontent.com/cristianlabo/TP3/master/Imagenes/definicion_funciones_implementacion1_4.png)


En la implemetancion se generaron mensajes de salida por el usart los cuales dieron el siguiente resultado:

![salida_puerto_serie_implementacion_1.png](https://raw.githubusercontent.com/cristianlabo/TP3/master/Imagenes/salida_puerto_serie_implementacion_1.png)


# 5 Implementacion 2

En la siguiente figura se puede ver el diagrama temporal de la distribución del tiempo de CPU entre tareas, Kernel,
Interrupciones:

![grafico_implementacion2.png](https://raw.githubusercontent.com/cristianlabo/TP3/master/Imagenes/grafico_implementacion2.png)

Se puede observar que la tarea 2 (prioridad 3) saca un dato en la cola,se bloquea si esta vacia y entrega el semaforo,luego toma el control del cpu la tarea 3(prioridad 2) toma el semaforo y se bloquea, despues toma el control de la cpu la tarea 1(prioridad 1) la cual espera un delay bloqueada y genera una interrupcion que carga un dato en la cola y se repite el ciclo.

El codigo del main de la implemetacion se puede ver en la siguiente figura:

![main_implementacion2_1.png](https://raw.githubusercontent.com/cristianlabo/TP3/master/Imagenes/main_implementacion2_1.png)

![main_implementacion2_2.png](https://raw.githubusercontent.com/cristianlabo/TP3/master/Imagenes/main_implementacion2_2.png)

Las funciones y tareas utilizadas son las siguientes:

![definicion_funciones_implementacion2_1.png](https://raw.githubusercontent.com/cristianlabo/TP3/master/Imagenes/definicion_funciones_implementacion2_1.png)

![definicion_funciones_implementacion2_2.png](https://raw.githubusercontent.com/cristianlabo/TP3/master/Imagenes/definicion_funciones_implementacion2_2.png)

![definicion_funciones_implementacion2_3.png](https://raw.githubusercontent.com/cristianlabo/TP3/master/Imagenes/definicion_funciones_implementacion2_3.png)

![definicion_funciones_implementacion2_4.png](https://raw.githubusercontent.com/cristianlabo/TP3/master/Imagenes/definicion_funciones_implementacion2_4.png)


En la implemetancion se generaron mensajes de salida por el usart los cuales dieron el siguiente resultado:

![salida_puerto_serie_implementacion_2.png](https://raw.githubusercontent.com/cristianlabo/TP3/master/Imagenes/salida_puerto_serie_implementacion_2.png)


# 6 Implementacion 3

En la siguiente figura se puede ver el diagrama temporal de la distribución del tiempo de CPU entre tareas, Kernel,
Interrupciones:

![grafico_implementacion3.png](https://raw.githubusercontent.com/cristianlabo/TP3/master/Imagenes/grafico_implementacion3.png)

Se puede observar que la tarea 1 (prioridad 1) toma el mutex usa led 1 para mostrar una secuencia de encendido y apagados, luego entrega el mutex y se bloquea un tiempo determinado.Luego toma el control del cpu la tarea 2(prioridad 1) la cual toma el mutex,realiza las mismas acciones con el led 2 y libera el mutex.Despues toma el control de la cpu la tarea 1(prioridad 1) la cual toma el mutex ,realiza las mismas acciones con el led 3 y libera el mutex para que la tarea 1 tome el control y se repite el ciclo.

El codigo main de la implemetacion se puede ver en la siguiente figura:

![main_implementacion3_1.png](https://raw.githubusercontent.com/cristianlabo/TP3/master/Imagenes/main_implementacion3_1.png)

![main_implementacion3_2.png](https://raw.githubusercontent.com/cristianlabo/TP3/master/Imagenes/main_implementacion3_2.png)

Las funciones y tareas utilizadas son las siguientes:

![definicion_funciones_implementacion3_1.png](https://raw.githubusercontent.com/cristianlabo/TP3/master/Imagenes/definicion_funciones_implementacion3_1.png)

![definicion_funciones_implementacion2_2.png](https://raw.githubusercontent.com/cristianlabo/TP3/master/Imagenes/definicion_funciones_implementacion2_2.png)

![definicion_funciones_implementacion2_3.png](https://raw.githubusercontent.com/cristianlabo/TP3/master/Imagenes/definicion_funciones_implementacion2_3.png)

![definicion_funciones_implementacion2_4.png](https://raw.githubusercontent.com/cristianlabo/TP3/master/Imagenes/definicion_funciones_implementacion2_4.png)


En la implemetancion se generaron mensajes de salida por el usart los cuales dieron el siguiente resultado:

![salida_puerto_serie_implementacion_2.png](https://raw.githubusercontent.com/cristianlabo/TP3/master/Imagenes/salida_puerto_serie_implementacion_2.png)

# 7 Hoja de ruta
