set filename=%1


@REM build html--------------------
@REM pandoc --self-contained -s --mathjax=js/loadMathjax.js source/%1.md -o docs/%1.html

pandoc --template=template.html --self-contained -s --mathjax=js/loadMathjax.js source/%1.md -o docs/%1.html





@REM 文字コードをUTF-8に変換--------------------
chcp 65001


@REM タイトルの取得--------------------
FOR /F "usebackq delims=" %%i in (`FINDSTR /C:"title:" source\\%1.md`) DO @SET title=%%i

@REM 何日目の取得--------------------
FOR /F "usebackq delims=" %%i in (`FINDSTR /C:"days:" source\\%1.md`) DO @SET days=%%i




@REM @REM index.mdのチェック--------------------
@REM FOR /F "usebackq delims=" %%i in (`FINDSTR /C:"%1" source\\index.md`) DO @SET flag=%%i


@REM Cheak link in index.md
FIND "%1" source\\index.md >nul 2>&1

@REM write index--------------------
if %ERRORLEVEL% equ 1 (
    echo ""
    call :WriteIndex
) else (
    echo ""
)

exit /b


@REM 文字コードをShift-JISに戻す--------------------
chcp 932


@REM @REM write index.md--------------------
:WriteIndex
set text=* Day%days:days:=% : [%title:title: =%](.\%filename%.html)
echo %text% >>source\index.md
exit /b