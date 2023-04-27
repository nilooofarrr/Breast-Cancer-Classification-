import pandas as pd
import matplotlib.pyplot as plt
from sklearn.decomposition import PCA
from sklearn.preprocessing import StandardScaler
#matplotlib inline


# Load CSV (using python) and Restore in to a 2D data matrix
#import csv
#import numpy
#filename = 'Raw_INt_methylation27579.csv'
#raw_data = open(filename, 'rt')
#reader = csv.reader(raw_data, delimiter=',', quoting=csv.QUOTE_NONE)
#x = list(reader)
#data = numpy.array(x).astype('str')
#print(data.shape)
#print(data[0, 136])



features = ["" for x in range(27578)]

for i in range(0, 27578):
  features[i] = 'F' + str(i+1)

print (features)



# Load CSV using Pandas
import pandas
filename = 'Raw_INt_methylation27579.csv'
#names = ['preg', 'plas', 'pres', 'skin', 'test', 'mass', 'pedi', 'age', 'class']
data = pandas.read_csv(filename, names=features)
print(data.shape)



# Transpose data
data = [list(i) for i in zip(*data)]
print(data[0])
features = data[0]
#print(data.shape)



# Convert array to matrix
data = numpy.matrix(data)
# Load CSV (using python) and Restore in to a 2D data matrix
import csv
import numpy
filename = 'Raw_INt_methylation27579.csv'
raw_data = open(filename, 'rt')
reader = csv.reader(raw_data, delimiter=',', quoting=csv.QUOTE_NONE)
x = list(reader)
data = numpy.array(x).astype('str')
#print(data.shape)
#print(data[0, 136])


# Transpose data
data = [list(i) for i in zip(*data)]
print(data[0])

#print(data.shape)

# Convert array to matrix
data = numpy.matrix(data)
#print(data[0, 27579])
#print(data.shape)

raw_data.close()

#print(data[0, 27579])
#print(data.shape)



#Standardize the Data

x = data.loc[:, features].values

y = data.loc[:,['Target']].values

x = StandardScaler().fit_transform(x)

print ( pd.DataFrame(data = x, columns = features).head() )

raw_data.close()


