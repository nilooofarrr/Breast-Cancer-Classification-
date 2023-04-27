
filename = "Methylation5000.csv"
f=open(filename,"r")

Features = ["" for x in range(5000)]

for i in range(0, 5000):
    Features[i] = 'f' + str(i+1)


print (Features)

for line in f:
 print( f.readline() )



f.close()




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
features = data[0]
#print(data.shape)

# Convert array to matrix
data = numpy.matrix(data)
#print(data[0, 27579])
#print(data.shape)

raw_data.close()

# Write to file
#with open('outfile.txt','wb') as f:
#    for line in data:
#        numpy.savetxt(f, f.write('This is a test\n')line, fmt='%.5f')
#f.close()


# Write to a file
#f = open('myfile', 'w')
#f.write('hi there\n')  # python will convert \n to os.linesep
#f.close()




#Principle Component Analysis (PCA) for Data Visualization


