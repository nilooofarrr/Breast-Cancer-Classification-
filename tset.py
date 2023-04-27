

# Load CSV using Pandas
import pandas

filename = 'Methylation5000.csv'

#names = ['preg', 'plas', 'pres', 'skin', 'test', 'mass', 'pedi', 'age', 'class']



features = ["" for x in range(1023)]

for i in range(0, 1023):
  features[i] = 'F' + str(i+1)

print(features)



data = pandas.read_csv(filename, names=features)

print(data.shape)



