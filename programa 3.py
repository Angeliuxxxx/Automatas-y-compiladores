def clasificar_lexema(lexema):
    # Verificar si es un número entero
    if lexema.isdigit() or (lexema.startswith('-') and lexema[1:].isdigit()):
        return "número"
    # Verificar si es una palabra (solo letras)
    elif lexema.isalpha():
        return "palabra"
    # Si contiene tanto números como letras o símbolos
    else:
        return "compuesta"

def procesar_archivo(archivo):
    with open(archivo, 'r') as file:
        contenido = file.read()
    
    # Calcular total de caracteres (con y sin espacios)
    total_caracteres_con_espacios = len(contenido)
    total_caracteres_sin_espacios = len(contenido.replace(" ", "").replace("\n", ""))

    # Dividir el contenido en lexemas (separados por espacios o saltos de línea)
    lexemas = contenido.split()

    # Inicializar contadores
    total_lexemas = len(lexemas)
    contador_palabras = 0
    contador_numeros = 0
    contador_compuestas = 0
    
    # Clasificar cada lexema
    for lexema in lexemas:
        clasificacion = clasificar_lexema(lexema)
        if clasificacion == "palabra":
            contador_palabras += 1
        elif clasificacion == "número":
            contador_numeros += 1
        else:
            contador_compuestas += 1
    
    # Imprimir resultados
    print(f"Total de caracteres (con espacios): {total_caracteres_con_espacios}")
    print(f"Total de caracteres (sin espacios): {total_caracteres_sin_espacios}")
    print(f"Total de lexemas: {total_lexemas}")
    print(f"Total de palabras: {contador_palabras}")
    print(f"Total de números: {contador_numeros}")
    print(f"Total de combinadas: {contador_compuestas}")

# Solicitar entrada del archivo de texto
archivo_entrada = input("Introduce la ruta del archivo de texto: ")

# Procesar el archivo
procesar_archivo(archivo_entrada)
