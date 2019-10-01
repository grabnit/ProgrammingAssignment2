## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## First create the function makeCacheMatrix that is a function of (x = matrix())

makeCacheMatrix <- function(x = matrix()) {
  ## create function with argument x being type matrix
  m <- NULL
  ## define variable m as NULL to hold the value of the matrix
  set <- function(mat) {
    ## define a set function to pass in the new variable as a part of the parent environment
    x <<- mat
    ## assigning x as the mat value in the parent environment
    m <<- NULL
    ## if there is a new matrix, need to reset variable m to NULL
  }
  get <- function() x
  ## define a get function that returns the value of the matrix argument
  
  setCache <- function(solve) m <<- solve
  ## define the setCache function that assigns the value of m in the parent environment
  getCache <- function() m
  ## define the getCache function that returns the value of m in the parent environment
  list(set = set, get = get, setCache = setCache, getCache = getCache)
  ## define list object that inputs to be able to use the $ operator
  
}

## Write a short comment describing this function

cacheSolve <- function(x, ...) {
## define the function cacheSolve as a function of 
  m <- x$getCache()
  ##define m in this function as the cached value for the inverse
  if(!is.null(m)) {
    message("getting Cached data")
    return(m)
    ##if the cache was NOT empty the value is just returned
  }
  data <- x$get()
  ##retrieve the value of the matrix
  m <- solve(data)
  ##define m now as the inverse matrix
  x$setCache(m)
  ##cache the result
  m
  ##return the inverse
}
