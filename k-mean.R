kMeanClus <- function(data, k){
  d <- ncol(data) #dimension of data
  n <- nrow(data) #number of data
  
  #which cluster a datum belongs to
  label <- rep(0, n)
  
  data_min <- apply(data, 2, min)
  data_max <- apply(data, 2, max)
  
  #generate initial centers of clusters randomly
  c_center <- runif(d*k, data_min, data_max)
  c_center <- matrix(c_center, nrow=k, ncol=d, byrow=T)
  
  repeat{
    #assign each datum to nearest cluster center
    for(i in 1:n){
      min_dist <- Inf
      for(j in 1:k){
        dist <- sum((data[i,] - c_center[j,])^2)
        if(min_dist > dist){
          min_dist <- dist
          nearest_c <- j
        }
      }
      label[i] <- nearest_c
    }
    
    pre_center <- c_center
    
    #re-calculate center of clusters
    for(j in 1:k){
      data_sub <- subset(data, label==j)
      c_center[j,] <- apply(data_sub, 2, mean)
    }
    
    #repeat ends if c_center converges
    if(sqrt(sum((c_center-pre_center)^2)) / sum(c_center) < 0.0001) break;
  }
  
  return(list(label, c_center))
}