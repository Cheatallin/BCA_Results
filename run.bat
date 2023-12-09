@echo off
:: Replace Rscript.exe with the path to your Rscript.exe
Rscript.exe .\BCA_Calculation_Template.R %* > output.log
:: When drag & drop, wait for input so it's not closed immediately
pause
