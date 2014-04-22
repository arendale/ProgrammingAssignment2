## Put comments here that give an overall description of what your
## functions do

## The inverse of matrix is cached so that when we need it again, we can fetch it 
## quickly instead of recalculating it if it is not changed. If it is changed, we
## recalculate it and cache it again.

## Write a short comment describing this function

## makeCacheMatrix function creats a "matrix" which contatins a list of functions:
## set, get, setinverse, getinverse

makeCacheMatrix <- function(x = matrix(dd)) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <-  function() x
  setinverse <- function(inverse) m <<- inverse
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Write a short comment describing this function

## cacheSolve function first checks to see if the inverse has been calculated
## If so, it gets the inverse matrix from cache and skips the calculation.
## Otherwise, it calculates the inverse of matrix and set it in cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
}
