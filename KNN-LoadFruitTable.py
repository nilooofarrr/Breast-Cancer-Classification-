import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
from sklearn.model_selection  import train_test_split


fruits = pd.read_table('fruit_data_with_colors.txt')
print( fruits.head() )


lookup_fruit_name = dict(zip(fruits.fruit_label.unique(), fruits.fruit_name.unique() ))
print (lookup_fruit_name)


X= fruits[['mass', 'width', 'height']] #array
Y= fruits['fruit_label'] #scaller

X_train, X_test, Y_train, Y_test = train_test_split(X, Y, random_state=0)

#VISUALIZATION ??!!


from matplotlib import cm

cmap = cm.get_cmap('gnuplot')

scatter = pd.scatter_matrix(X_train, c = Y_train, marker = 'o', s=40, hist_kwds={'bins': 15}, figsize = (12, 12), cmap=cmap )


 
#from mpl.tolkits.mplot3d import Axes3D
#fig = plt.figure()
#ax=fig.add_subplot(111, projection ='3d')
#ax.scatter(X_train['width'], X_train['height'], X_train['color_score'], c=Y_train, marker = 'o', s=100)
#ax.set_xlabel('width')
#ax.set_ylabel('height')
#ax.set_zlabel('color_score')

#plt.show()

from sklearn.neighbors import KNeighborsClassifier

knn = KNeighborsClassifier(n_neighbors=11)
print(knn.fit(X_train, Y_train))
print (knn.score(X_test, Y_test))







