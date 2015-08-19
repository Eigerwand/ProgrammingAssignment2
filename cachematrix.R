## here wedefinethe funstions that manipulate the needed variables and 
## functions within the environment from where we execute the returned functions

makeCacheMatrix <- function(x = matrix()) {
    inverse <- NULL # The initial inverse doesn't exist
    
    set <- function(y) { # set the value of the matrix and it's inverse
        x <<- y
        inverse <<- NULL
    }
    
    get <- function() x # returns the defined matrix
    
    setinverse <- function(created) inverse <<- created # sets the inverse
    
    getinverse <- function() inverse # returns the inverse
    
    # return the functions for use in calling environment
    list(set = set, get = get, setinverse =setinverse, getinverse = getinverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
