% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/example_data.R
\name{example_repo_setup}
\alias{example_repo_setup}
\title{Set up example repo files}
\usage{
example_repo_setup(dest_dir = tempdir())
}
\arguments{
\item{dest_dir}{The destination directory you would like the example repo files to be placed. By default is current directory.}
}
\value{
Sets up example files that can be used to test 'ottrpal' functions.
}
\description{
Set up example repo files
}
\examples{
\dontrun{

# Run this to get the files we need
example_files <- ottrpal::example_repo_setup()
}
}
