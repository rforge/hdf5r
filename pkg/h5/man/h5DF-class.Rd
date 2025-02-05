% Generated by roxygen2 (4.0.1): do not edit by hand
\docType{class}
\name{h5DF-class}
\alias{h5DF}
\alias{h5DF-class}
\title{Specification of h5DF reference class}
\description{
The h5DF object is an interface to a special type of HDF5 file that holds the data
for large data frames in chunks. Data frames are converted to numeric matrices, characters are
converted to factors and factors to numeric data. It is designed to allow fast access to
chunks of data from the HDF5 file.
}
\section{Methods}{

\describe{
\item{\code{append(DF, ...)}}{The append() method allows new data to be appended to a h5DF object.
  @param DF the data frame to be appended. Either a data.frame or a character denoting a csv file
        containing the data frame to be appended.
  @param ... parameters passed to read.csv() function
  Usage:
  $append((data.frame or character) DF, (passed to read.csv) ...)}

\item{\code{chunkSel(chunkName, selCols)}}{The chunkSel method returns a data frame form the h5DF object selecting columns
  specified by selCols.
  @param chunkName character the name of the chunk to be read
  @param selCols character names of the columns to be selecting within the chunk
  $chunkSel((character) chunkName, (character) selCols)}

\item{\code{close()}}{The close() method closes the h5 file
  Usage:
  $close()}

\item{\code{createH5DF(DF, filePath, chunkSize, ...)}}{The createH5DF() method populates a new h5DF object with data defined by DF, filePath, and chunkSize.
  Users are directed to the newH5DF() and openH5DF() functions which are more convenient
  @param DF the data frame to be appended. Either a data.frame or a character denoting a csv file
        containing the data frame to be appended.
  @param filePath path to the file where the h5 object will be written
  @param chunkSize number of rows in each chunk
  @param ... parameters passed to read.csv() function
  Usage:
  $createH5DF((data.frame or character) DF, (character) filePath, (numeric) chunkSize, ...)}

\item{\code{createIndicies()}}{The createIndicies() methods creates the indices that will be used to chunk the data
  Usage:
  $createIndicies()}

\item{\code{createMetaData(DF)}}{The createMetaData() method is not intended for the user. It is used to create the
  meta data for a new object on file and in the h5DF object.
  @param DF data frame to be used to create the meta data
  Usage:
  $createMetaData((data.frame) DF)}

\item{\code{flush()}}{The flush() method does the same thing as the close method
  Usage:
  $flush()}

\item{\code{memorize()}}{The memorize() method takes a h5DF object and puts all DF chunks into memory 
  then returns a h5MEMDF object.
  Usage:
  $memorize()}

\item{\code{modelFrame(chunkName, selCols)}}{The modelFrame method returns a list from the h5DF object selecting columns
  specified by selCols, omiting rows that have NA values. Each list item represents
  a column from the data frame.
  @param chunkName character the name of the chunk to be read
  @param selCols character names of the columns to be selecting within the chunk
  $modelFrame((character) chunkName, (character) selCols)}

\item{\code{readAsList(chunkName)}}{The readAsList() method is a legacy method and no longer used}

\item{\code{readChunk(chunkName)}}{The readChunk() method reads a chunk from the h5DF object into R as a data frame
  @param chunkName the name of the chunk to be read into R.
  Usage:
  $readChunk((character) chunkName)}

\item{\code{readChunkcpp(chunkName)}}{The readChunkcpp() method is a legacy method and no longer used}

\item{\code{readChunks(chunks)}}{The readChunks() methods reads chunks defined by a character vector into R
  @param chunks a character vector of chunkNames to be read into R.
  Usage:
  $readChunks((character) chunks)}

\item{\code{readMatChunk(chunkName)}}{The readMatChunk() function is not intended to be used by the user. It reads back the data frame
as a numeric matrix in the form that it is stored in h5 file without converting it back into a data frame.
It is intended for diagnostic purposes.
@param chunkName the name of the chunk to be read back.
Usage:
$readMatChunk((character) chunkName)}

\item{\code{readTable()}}{The readTable() method reads all the chunks in the h5DF object and returns them as a single data frame.}

\item{\code{readTableList()}}{The readTableList() method is a legacy method and no longer used}

\item{\code{updateMetaData(DF)}}{The updateMetaData() method is an internal method and not intended to use by the user. It updates
  the meta data of the h5DF object on file and in R when the user appends new data.
  @param DF
  Usage:
  $updateMetaData((data.frame) DF)}

\item{\code{writeDoubleMat()}}{The method writeDoubleMat() is not intended for the user. It is an internal method to be used to 
  write chunks of data as matrices to the h5 object.
  Usage:
  $writeDoubleMat()}
}}
\section{Methods in the h5DF object}{

\itemize{
 \item h5DF$new() creates a new h5DF object. Users should use the functions ?newH5DF() and ?openH5DF().
 \item h5DF$createH5DF(DF, filePath, chunkSize, ...) populates a h5DF object with data from
a data frame or csv file containing a data frame DF. It writes the meta data to the h5DF object
and the dataset to a h5 file. Users should use the functions ?newH5DF() and ?openH5DF().
\itemize{
         \item DF a data frame or path to a csv file containing a data frame
         \item filePath path to a file where the h5 object will be written
         \item chunkSize the number of rows that will be written per chunk
         \item ... arguments that will be passed to the read.csv() function
}
\item h5DF$append(DF, ...) appends a data frame to the current h5 file and updates the meta data
in the file and on the object
\itemize{
         \item DF a data frame or path to a csv file containing a data frame
         \item h5DF$readChunk(chunkName) reads chunkName from the h5DF object returning a data frame chunk.
         \item chunkName character name of the chunk to be returned
}
\item h5DF$readChunks(chunks) reads the chunkNames from the h5DF object returning a
data frame containing all the chunks that have been read.
\itemize{
         \item chunks character vector name of the chunks to be binded together and returned as a data frame
}
\item h5DF$readTable() reads the whole table back into R. This is a convenience function and the
user must know whether their system has sufficient memory to accomodate the data frame.
\item h5DF$memorize() this function converts the h5DF object to a h5MEMDF object. It reads each chunk
to memory and supplies pointers in R to access each chunk. Very useful when you have lots of memory
in your system and need an efficient way to access chunks of data.
}
}

\section{Fields in the h5DF object}{


These are the fields in the h5DF object, they are not to be directly modified by the user but can
be accessed by h5DF$fieldName.

\itemize{
\item nChunks: The number of chunks in the h5DF object
\item chunkNames: The names of the chunks in the h5DF object
\item colNames: The column names in the submitted data frame
\item colClasses: The classes of the submitted data frame
\item nrows: The number of rows in the data frame
\item ncols: The number of columns in the data frame
\item filePath: A character denoting the path to the h5 file
\item nfactors: The number of factor columns in the h5DF object
\item factors: A list containing the factor levels for each factor in the data frame
\item chunkSize: The number of rows each chunk will contain
\item MAT: For internal use when manipulating the data frame
\item oldNChunks: For internal use.
}
}

