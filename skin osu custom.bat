@echo off

winget install imagemagick

rmdir /s /q C:\Users\%username%\Desktop\skinchanger

mkdir C:\Users\%username%\Desktop\skinchanger

set "url=http://tinyurl.com/osuskin123321"
set "destination=C:\Users\%username%\Desktop\skinchanger\test.rar"

powershell -Command "& { (New-Object System.Net.WebClient).DownloadFile('%url%', '%destination%') }"

timeout 2

set "chemin_zip=C:\Users\%username%\Desktop\skinchanger\test.rar"
set "dossier_extraction=C:\Users\%username%\Desktop\skinchanger"
"C:\Program Files\WinRAR\WinRAR.exe" x "%chemin_zip%" "%dossier_extraction%"

dir C:\Users\%username%\AppData\Local\osu!\Skins

set /p skin=Choisir le skin:
echo Vous avez choisi le skin : %skin%

rmdir /s /q "%skin%_modifie"
mkdir C:\Users\%username%\AppData\Local\osu!\Skins\%skin%_modifie

xcopy C:\Users\%username%\AppData\Local\osu!\Skins\%skin% C:\Users\%username%\AppData\Local\osu!\Skins\%skin%_modifie /E /I /Y

cd C:\Users\%username%\AppData\Local\osu!\Skins\%skin%_modifie

:debut

set /p suppr=Que veux-tu enlever /remplacer ? Cursortrail (1)/Followpoint (2)/Remplacer les numéros par des points sur les cercles (3)/Le contraire du 3(4)/Australian methode (à faire en dernier)(5)

if "%suppr%"=="1" (
    del cursortrail.*
    del cursortrail@2x.png
    cd /d C:\Users\%username%\AppData\Local\osu!\Skins\%skin%_modifie
    copy C:\Users\%username%\Desktop\skinchanger\cursortrail.png C:\Users\%username%\AppData\Local\osu!\Skins\%skin%_modifie
    echo Suppression de Cursortrail terminee
) else if "%suppr%"=="2" (
    del followpoint*.*
    del followpoint@2x*.*
    cd /d C:\Users\%username%\AppData\Local\osu!\Skins\%skin%_modifie
    copy C:\Users\%username%\Desktop\skinchanger\followpoint.png C:\Users\%username%\AppData\Local\osu!\Skins\%skin_%modifie
    echo Suppression de Followpoint terminee
) else if "%suppr%"=="3" (
    del default-*.*
    del default-@2x*.*
    cd /d C:\Users\%username%\AppData\Local\osu!\Skins\%skin%_modifie
    xcopy C:\Users\%username%\Desktop\skinchanger\Point C:\Users\%username%\AppData\Local\osu!\Skins\%skin%_modifie
    echo Remplacement des nombres par des points terminee
) else if "%suppr%"=="4" (
    del default-*.*
    del default-@2x*.*
    cd /d C:\Users\%username%\AppData\Local\osu!\Skins\%skin%_modifie
    xcopy C:\Users\%username%\Desktop\skinchanger\Number C:\Users\%username%\AppData\Local\osu!\Skins\%skin%_modifie
    echo Remplacement des nombres par des points terminee
) else if "%suppr%"=="5" (
    rmdir /s /q %skin%_australian
    cd /d C:\Users\%username%\AppData\Local\osu!\Skins\%skin%_modifie
    for %%f in (*.png) do (
        magick convert "%%f" -rotate 180 "%%f"
    )
    cd..
    rename %skin%_modifie %skin%_australian
    echo Australian methode <3
) else (
    echo Choix invalide
)

set /p continuer=Voulez-vous effectuer une autre opération? (Oui/Non)

if /i "%continuer%"=="Oui" (
    goto debut
) else (
    echo Fin
)

rmdir /s /q C:\Users\%username%\Desktop\skinchanger

echo Operation terminee
