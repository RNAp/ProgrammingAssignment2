specialMat$set(x)

ptm <- proc.time()
cacheSolve(specialMat)
a<-proc.time()-ptm

ptm <- proc.time()
cacheSolve(specialMat)
b<-proc.time()-ptm

ptm <- proc.time()
cacheSolve(specialMat)
c<-proc.time()-ptm

a
b
c