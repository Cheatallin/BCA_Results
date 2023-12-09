@echo off
:: Make sure Rscript.exe is in your PATH and all packages are installed
Rscript.exe .\BCA_Calculation_Template.R %* > output.log
:: When drag & drop, wait for input so it's not closed immediately
pause
