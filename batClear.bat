@echo off
echo Ejecucion de mantenimiento nivel 2
::paso 1.- Elimina temporales del equipo
echo 1.- Elimina temporales del equipo
del C:\Users\%username%\AppData\Local\Temp /f /s /q 
        rd C:\Users\%username%\AppData\Local\Temp /s /q
        del c:\Windows\Temp /f /s /q    
        rd c:\Windows\Temp /s /q
        del C:\Windows\Prefetch /f /s /q    
        rd C:\Windows\Prefetch /s /q
::Paso 2.- elimuna los documentos en papelera de reciclaje
echo elimina los documentos en papelera de reciclaje
rd /q /s c:\$Recycle.Bin

::paso 3.- Desfragmenta el disco automaticamente
echo Desfragmenta el disco automaticamente
 defrag c: -u /f

::paso 4.- desabilita inicio rapido
echo desabilita inicio rapido
Reg Add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /V HiberbootEnabled /T REG_DWORD /D 0 /F
   echo Se creara la carpeta de reporte de mantenimiento en el Disco local C:
:: se crea la carpeta
        mkdir C:\Users\%username%\Documents\Reportes_Mantenimiento
:: se crea el documento de registro de mantenimientos periodicos
         echo Registro de mantenimientos nivel 2, se aplicaron las siguientes puntos: > C:\Users\%username%\Documents\Reportes_Mantenimiento\Lista_de_Mantenimientos.txt
         @echo 1.- Limpieza de temporales y de papelera de reciclaje.>> C:\Users\%username%\Documents\Reportes_Mantenimiento\Lista_de_Mantenimientos.txt
         @echo 2.- Desfragmentacion de disco duro y desactivacion de inicio rapido. >> C:\Users\%username%\Documents\Reportes_Mantenimiento\Lista_de_Mantenimientos.txt
         @echo 3.- Reinicio total del sistema.>> C:\Users\%username%\Documentos\Reportes_Mantenimiento\Lista_de_Mantenimientos.txt
         @echo El registro del dia %date% y hora %time% se realizo con exito Nivel 2 en el equipo: %COMPUTERNAME%>> C:\Users\%username%\Documents\Reportes_Mantenimiento\Lista_de_Mantenimientos.txt
::DATO DIA
        date /t
:: DATO FECHA
        time /t
::paso 4.- Reinicia el equipo  automaticamente
echo Reinicia el equipo automaticamente
shutdown -r
