# Script creado por Exo del grupo de Telegram de ArchlinuxLatinoamerica

[dolar]                                          
label=DL                                         
interval=60                                      
separator=true                                   
command=curl -s https://banco.santanderrio.com.ar/exec/cotizacion/index.jsp | grep -aoP "(?<=<td>)[^<]*" | sed -n 3p
