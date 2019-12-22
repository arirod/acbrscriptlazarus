@echo off
call disclaimer.bat
@cls
:: 
:: Insira abaixo a pasta onde se encontra o binario lazarus (lazarus.exe) 
::@set LAZ_DIR=d:\lazarus32Bit
@set LAZ_DIR=C:\lazarus
::
:: INSIRA ABAIXO A PASTA DOS ARQUIVOS ACBR
@set ACBR_DIR=d:\dev-lazarus\lab_acbr\trunk2\pacotes\lazarus
::
@echo(
@echo Diretorio do arquivo "lazbuild": %LAZ_DIR%
@echo(
@echo Diretorio da Pasta "Lazarus\Pacotes": %ACBR_DIR%
::@echo %PRIMARY_CONFIG_PATH%
@echo(
@echo(
:choice
set /P c=As Informacoes estao Corretas e DESEJA prosseguir[S/N]?
if /I "%c%" EQU "S" goto :doRun
if /I "%c%" EQU "N" goto :doExit
goto :choice

:doExit
exit

:doRun
for /F "tokens=*" %%A in  ( acbrlist.txt ) do ( 
     %LAZ_DIR%\lazbuild.exe --add-package-link "%ACBR_DIR%\%%A"
    ) 
@echo ON 
@cls
::@echo ...Adicionando Pacotes Mandatorios
::%LAZ_DIR%\lazbuild.exe --add-package=ACBrComum
::%LAZ_DIR%\lazbuild.exe --add-package=ACBrDiversos
::%LAZ_DIR%\lazbuild.exe --add-package=ACBrTCP

@pause
@echo ...Build na IDE Lazarus
%LAZ_DIR%\lazbuild.exe --build-ide=

@cls

@echo Pronto!
@color 07 
