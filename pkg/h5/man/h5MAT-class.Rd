% Generated by roxygen2 (4.0.1): do not edit by hand
\docType{class}
\name{h5MAT-class}
\alias{h5MAT}
\alias{h5MAT-class}
\title{Specification of the h5MAT reference class}
\description{
The h5MAT object is an interface to a special type of HDF5 file that holds data
for large matrices in chunks. It is designed to allow fast access to chunks of data from the HDF5 file.
}
\section{Methods}{

\describe{
\item{\code{append(MAT, ...)}}{The append() method allows new data to be appended to a h5MAT object.
  @param MAT the matrix to be appended. Either a matrix or a character denoting a csv file
        containing the matrix to be appended.
  @param ... parameters passed to read.csv() function
  Usage:
  $append((matrix or character) MAT, (passed to read.csv()) ...)}

\item{\code{close()}}{The close() method closes the h5 file object
  Usage:
  $close()}

\item{\code{createH5MAT(MAT, filePath, chunkSize, ...)}}{The createH5MAT() method populates a new h5MAT object with data defined by MAT, filePath, and chunkSize.
  Users are directed to the newH5MAT() and openH5MAT() functions which are more convenient.
  @param MAT matrix or character file path to CSV containing matrix to be written to H5 file object
  @param filePath character path to file where h5 file will be written
  @param ... arguments passed to read.csv() function
  Usage:
  $createH5MAT((matrix or character) MAT, (character) filePath, (numeric) chunkSize, ...)}

\item{\code{createIndicies()}}{The createIndicies() methods creates the indices that will be used to chunk the data
  Usage:
  $createIndicies()}

\item{\code{createMetaData()}}{The createMetaData() method is not intended for the user. It is used to create the
  meta data for a new object on file and in the h5MAT object.
  Usage:
  $createMetaData()}

\item{\code{flush()}}{The flush() method is the same as the close method
  Usage:
  $flush()}

\item{\code{memorize()}}{The memorize() method writes a h5MAT object to memory and returns a h5MEMMAT object
  Usage:
  $memorize()}

\item{\code{readChunk(chunkName)}}{The readChunk() method reads a chunk from the h5MAT object into R as a matrix
  @param chunkName the name of the chunk to be read into R.
  Usage:
  $readChunk((character) chunkName)}

\item{\code{readChunks(chunks)}}{The readChunks() methods reads chunks defined by a character vector into R
  @param chunks a character vector of chunkNames to be read into R.
  Usage:
  $readChunks((character) chunks)}

\item{\code{readTable()}}{The readTable() method reads all the chunks in the h5MAT object and returns them as a single matrix.
  Usage:
  $readTable()}

\item{\code{updateMetaData()}}{The updateMetaData() method is an internal method and not intended to use by the user. It updates
  the meta data of the h5MAT object on file and in R when the user appends new data.
  Usage:
  $updateMetaData()}

\item{\code{writeDoubleMat()}}{The method writeDoubleMat() is not intended for the user. It is an internal method to be used to 
  write chunks of data as matrices to the h5 object.
  Usage:
  $writeDoubleMat()}
}}
\section{Methods in the h5MAT object}{

\itemize{
\item h5MAT$new() creates a new h5MAT object, users should use ?newH5MAT() or ?openH5MAT().
\item h5MAT$createH5MAT(MAT, filePath, chunkSize, ...) populates a h5MAT object with data from MAT.
Users should use ?newH5MAT() or ?openH5MAT().
\itemize{
   \item MAT a matrix or a path to a csv file containing a matrix to be converted to a h5MAT object
   \item filePath a character denoting a path to a location where the h5MAT object wll be written
   \item chunkSize number of rows denoting the size of each matrix chunk
   \item ... parameters to be passed to the read.csv() function
}
\item h5MAT$append(MAT, ...) appends matrix MAT to the current h5MAT object
\itemize{
   \item MAT a matrix or a path to a csv file containing a matrix to be converted to a h5MAT object
   \item ... parameters to be passed to the read.csv() function
}
\item h5MAT$readChunk(chunkName) reads the chunk denotes by chunkName into R as a matrix
\itemize{
   \item chunkName a character denoting the name of the chunk to be returned as a matrix
}
\item h5MAT$readChunks(chunks) read the chunks denotes by chunks into R as a matrix
\itemize{
   \item chunks a character vector denoting the chunks to be read into R as a single matrix
}
\item h5MAT$readTable() reads the whole matrix in the h5MAT into R as a matrix
\item h5DF$memorize() this function converts the h5MAT object to a h5MEMMAT object. It reads each chunk
to memory and supplies pointers in R to access each chunk. Very useful when you have lots of memory
in your system and need an efficient way to access chunks of data.
}
}

\section{Fields in the h5MAT object}{

These are the fields in the h5MAT object, they are not to be directly modified by the user but can
be accessed by h5MAT$fieldName.

\itemize{
\item nChunks: The number of chunks in the h5MAT object
\item chunkNames: The names of the chunks in the h5MAT object
\item nrows: The number of rows in the data frame
\item ncols: The number of columns in the data frame
\item filePath: A character denoting the path to the h5 file
\item chunkSize: The number of rows each chunk will contain
\item MAT: For internal use when manipulating the data frame
\item oldNChunks: For internal use.
}
}

