#read wine data
wine <- read.table("wine.txt",sep=",")

#1st column of the data is class identifier
wine_kinds <- wine[,1]
wine <- wine[,2:14]

#process data with PCA
wine_map <- mypca(wine)

#plot the mapped data by PCA with coloring based on the original class
par(new=F)
plot(wine_map, col=wine_kinds+1, xlim=c(-4.5,4.5), ylim=c(-4.5,4.5))

#clustering mapped data with k-means
wine_label <- kMeanClus(wine_map, 3)

#re-plot the mapped data by PCA with coloring based on the clustering
plot(wine_map, col=wine_label[[1]]+1, xlim=c(-4.5,4.5), ylim=c(-4.5,4.5))
#add center of the clusters into the plot
par(new=T)
plot(wine_label[[2]], pch="+", cex=3, xlim=c(-4.5,4.5), ylim=c(-4.5,4.5), xlab="", ylab="")


