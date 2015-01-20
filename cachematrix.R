## the following functions calculate inverse of a given invertible matrix
## and store the results in cache. If the inverse is recalculated, 
## the functions retrieve inverse results from cache instead of calculating inverse again

# makeCacheMatrix creates a special "matrix",
# which is a list containing a function to
# set : set the value of the matrix
# get : get the value of the matrix
# setInv : set the value of the inverse
# getInv : get the value of the inverse

makeCacheMatrix <- function(specialMat = matrix()) {
        inv <- NULL
        set <- function(mat) {
                specialMat <<- mat
                inv <<- NULL
        }
        
        get <- function(){
                specialMat
        }
        
        setInv <- function(invMat){
                inv<<-invMat
        }
        
        getInv <- function(){
                inv
        }
        list(set=set, get=get, setInv=setInv, getInv=getInv)
}


## The following function calculates the mean of the special "matrix" 
## created with the above makeCacheMatrix function. 
## However, it first checks to see if the inverse has already been calculated. 
## If so, it gets the matrix inverse from the cache and skips the computation. 
## Otherwise, it calculates the inverse of the matrix and sets the value of the inverse in the cache via the setInv function.



cacheSolve <- function(specialMat, ...) {
        ## Return a matrix that is the inverse of 'mat'
        invMat <- specialMat$getInv()
        if (!is.null(invMat)){
                message("getting matrix inverse...")
                return(invMat)
        }
        mat<- specialMat$get()
        dim <- dim(mat)
        # when the matrix is square matrix, use solve() to obtain matrix inverse
        if (dim[1]==dim[2]) {
                message("calculating matrix inverse...")
                invMat <- solve(mat)
                specialMat$setInv(invMat)
                return(invMat)
        }
        
        # when matrix is non square, use MASS:ginv() to calculate Moore-Penrose generalized inverse 
        message("calculating matrix inverse...")
        invMat <- MASS::ginv(mat)
        specialMat$setInv(invMat)
        invMat
}
