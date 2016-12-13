mypca <- function(data){
  d <- ncol(data) #dimension of data
  n <- nrow(data) #number of data
  
  #normalize data
  data.c <- apply(data,2,scale)
  
  #calculate covariant matrix
  C <- matrix(0, nrow=d, ncol=d)
  for(i in 1:n){
    C <- C + data.c[i,] %o% data.c[i,]
  }
  
  #calculate eigen vector & eigen value (sorted in decreasing order)
  z <- eigen(C, symmetric = T)
  
  #regularize 1st & 2nd eigen vector
  t1 <- z$vectors[,1] / sqrt(sum((z$vectors[,1])^2))
  t2 <- z$vectors[,2] / sqrt(sum((z$vectors[,2])^2))
  T_pca <- matrix(c(t1,t2), nrow=d, ncol=2, byrow=F)
  
  #map data
  map_data <- data.c %*% T_pca
  
  #plot(map_data)
  
  return(map_data)
}