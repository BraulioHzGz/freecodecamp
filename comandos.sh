# Tipos de I/O en bash 
<	# Pasar argumento o file
>	# Exportar a un archivo
>>	# Append command

# Flags en bash 
--color		# Pone color a un patrón
-n			# Agrega número de linea al comienzo de un patrón

# Comandos bash
grep -o meow[a-z]* kitty_ipsum_2.txt | wc -l >> kitty_info.txt 							# Contar cuántas veces sale un patrón en un texto
grep meow[a-z]* -n kitty_ipsum_1.txt | sed -E 's/([0-9]+).*/\1/' >> kitty_info.txt 		# Contar en que líneas sale un patrón, en este caso: cat
cat kitty_ipsum_2.txt | wc -l >> kitty_info.txt 										# Contar total de líneas de un archivo 
wc -l	# Contar líneas
wc -w	# Contar palabras
wc -m	# Contar caracteres
wc -w < kitty_ipsum_2.txt >> kitty_info.txt		# Pasar como argumento un archivo usando '<' y append en kitty_info.txt
cat $1 | sed 's/catnip/dogchow/; s/cat/dog/'	# Leer parámetro ($1) y reemplazar cadenas
grep '<patron1>|<patron2>'
diff <archivo1> <archivo2>		# Ver las diferencias entre 2 archivos
