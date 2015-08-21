## here we define the funstions that manipulate the needed variables and 
## functions within the environment from where we execute the returned functions

makeCacheMatrix <- function(x = matrix()) {
    
    inverse <- NULL # The initial inverse doesn't exist
    
    set <- function(y) { # set the value of the matrix and NULL it's inverse
        x <<- y
        inverse <<- NULL
    }
    
    get <- function() x # returns the defined matrix
    
    setinverse <- function(created) inverse <<- created # sets the inverse
    
    getinverse <- function() inverse # returns the inverse
    
    # return the functions for use in calling environment
    list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## now to get the inverse. if previously computed return that previous value
## els compute anew and update.
## Note: we do no checking on incoming matrix, but assume it is square and
## invertabe so that the output is valid

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    m <- x$getinverse() # whats in current instantiation
    
    if(!is.null(m)) { # It has already been computed
        message("getting cached data")
        return(m)
    }
    data <- x$get() # else we need to compute it
    m <- solve(data, ...) # assume that data invertable
    x$setinverse(m) # update the enviroment
    m               # return the inverse
}
