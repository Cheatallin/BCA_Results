# BCA Results

This template is to calculate BCA concentrations with set up BSA standards

## Library Setup

Please have a check on file "Library.txt" before running for this template
If it is first time running for this template
Then please install those packages by copy to your R terminal

```cmd
install.packages(c("readxl", "summarytools", "skimr", "ggplot2"))
```

## BSA Standards

In this template, we have 0.05g/l, 0.1g/l, 0.2g/l and 0.4g/l standard to form linear regression models
If you are having those four standard concentrations please proceed without modification

## 96-wells plate setup

In this template, we setup 96-well plate in .xlsx style which is:

```
A1 for each variables name
A2~C2 for each blanks
A3~C3 for each 0.05g/l standard
A4~C4 for each 0.1g/l standard
A5~C5 for each 0.2g/l standard
A6~C6 for each 0.4g/l standard
Ax~Cx for each unknown proteins
```

If plate setup followed in that way, then delete all the other empty column
The "Sample.xlsx" and "Sample.csv" will be shown in this folder

## Notes

Remember that this template is only having two unknown proteins
If we are having more than 2 unknown proteins
Then you need to add another 'Unk3', 'Unk4 etc.

## More than 2 samples

Remember to add in each line that related to 'Unk_x'

# Warning

This template is only to use for calculating of BCA results
Do not respond for any self-examination of validity of data
Please check R-square and p-value themselves in terminal as the command has been added in this template
