def clasificar_palabra(palabra):
    
    if palabra.isdigit() or (palabra.startswith('-') and palabra[1:].isdigit()):
        return "entero"
   
    elif palabra.isalpha():
        return "palabra"
    
    else:
        return "compuesta"

def clasificar_cadena(cadena):
    
    palabras = cadena.split()
    
    
    contador_entero = 0
    contador_palabra = 0
    contador_compuesta = 0
    
   
    for palabra in palabras:
        clasificacion = clasificar_palabra(palabra)
        if clasificacion == "entero":
            contador_entero += 1
        elif clasificacion == "palabra":
            contador_palabra += 1
        else:
            contador_compuesta += 1
    
    
    salida = ""
    if contador_entero > 0:
        salida += f"{contador_entero} - entero"
    if contador_palabra > 0:
        if salida:
            salida += ", "
        salida += f"{contador_palabra} - palabra"
    if contador_compuesta > 0:
        if salida:
            salida += ", "
        salida += f"{contador_compuesta} - compuesta"
    
    return salida


entrada = input("Introduce una cadena de caracteres: ")

resultado = clasificar_cadena(entrada)


print(resultado)
