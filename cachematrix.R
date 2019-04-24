## Put comments here that give an overall description of what your
## functions do
Our aim in this experiment is to write a pair of functions, namely, "makeCacheMatrix" 
and "cacheSolve" that cache the inverse of a matrix
## Write a short comment describing this function
## makeCacheMatrix is a function which creates a special "matrix" 
## object that can cache its inverse for the input (which is an invertible square matrix)

makeCacheMatrix <- function(x = matrix()) {
  
  inv <- NULL
  set <- function(y){
    x <<- y
    inv <<- NULL
  }
  get <- function()x
  setInverse <- function(solveMatrix) inv <<- solveMatrix
  getInverse <- function()inv
  list(set=set, get = get, setInverse = setInverse, getInverse = getInverse)
}
## Write a short comment describing this function
## cacheSolve is a function which computes the inverse of the special "matrix" 
## returned by makeCacheMatrix above. If the inverse has already been calculated 
## (and the matrix has not changed), then the cachesolve should retrieve the 
## inverse from the cache
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inv <- x$getInverse()
  if(!is.null(inv)){
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data)
  x$setInverse(inv)
  inv      
}

## Check the program##
## m <- matrix (rnorm(16), 4,4)
## m1 <- makeCacheMatrix(m)
## cacheSolve(m1)
> cacheSolve(m1)
           [,1]       [,2]        [,3]      [,4]
[1,] -0.1369545 -0.7350672  0.85094510  2.367859
[2,] -0.1549140  2.3869476 -1.10435487 -3.821390
[3,] -0.1826709 -1.0198260  0.87481425  1.766438
[4,] -0.7133921 -0.3923479 -0.09709581  1.883108
