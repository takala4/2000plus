call build.bat %date:~0,4%%date:~5,2%%date:~8,2%

@REM build index.html--------------------
@echo off
pandoc --self-contained -s --mathjax=js/loadMathjax.js source/index.md -o docs/index.html


