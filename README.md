#Description for each file
wine.txt:
Original wine data obtained from http://mlr.cs.umass.edu/ml/machine-learning-databases/wine/wine.data .
For further information of the data, see http://mlr.cs.umass.edu/ml/datasets/Wine .

pca.R:
My PCA function.
Given matrix or data frame (contains only numerical value), it returns data reduced into 2-dimension.

k-mean.R:
My k-means clustering function.
Given matrix or data frame (contains only numerical value) and the number of clusters (k) you want to divide into, it returns a list of cluster labels (1~k for each datum) and center positions of each cluster.

wine.R:
Analyze wine.txt with my pca and k-means clustering function above, and plot the results.
