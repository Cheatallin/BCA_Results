@echo off
:: Place R-4.1.3 in the same folder as this folder
:: Root folder
:: -- BCA_Results
:: -- R-4.1.3
"..\R-4.1.3\bin\Rscript.exe" .\BCA_Calculation_Template.R %* > output.log
:: When drag & drop, wait for input so it's not closed immediately
pause
