## Put comments here that give an overall description of what your
## functions do

## This R script contains 2 functions which allow for the creation of a matrix
## in which it's inverse can be cached to improve performance

## Write a short comment describing this function
## A function which contains functions for the operations required
## to create, store, retrieve and cache the inverse of a matrix

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) m <<- solve
  getsolve <- function() m
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}


## Write a short comment describing this function
## Calculate and return the inverse of a matrix.  The result
## is cached and returned from the cache if it already exists.
cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m <- x$getsolve()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setsolve(m)
  m
}
