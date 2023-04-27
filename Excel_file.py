import pandas as pd
from pandas import ExcelWriter
from pandas import ExcelFile

df = pd.read_excel('Book2.xlsx', sheetname='Sheet1')

print("Column headings:")
print(df.columns)

print(df['F1'])