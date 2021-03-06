% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_degree.R
\name{get_degree}
\alias{get_degree}
\title{Find node degree for epicontacts objects}
\usage{
get_degree(x, type = c("in", "out", "both"), only_linelist = FALSE)
}
\arguments{
\item{x}{an \code{\link{epicontacts}} object}

\item{type}{the type of degree to be computed (see description); if contacts
are not directed, this will be forced to 'both'}

\item{only_linelist}{a logical indicating if cases whose degree is computed
should be from the linelist exclusively}
}
\description{
This function computes the number of contacts per cases in a
\code{\link{epicontacts}} dataset. Whenever contacts are directed, the
argument 'type' can be used to specify which kind of contact should be
considered: 'in' (towards the case), 'out' (from the case), or 'both'.
}
\examples{
## make epicontacts object
if (require(outbreaks)) {
x <- make_epicontacts(ebola.sim$linelist, ebola.sim$contacts,
                       id="case.id", to="case.id", from="infector",
                       directed=TRUE)
x

## compute in-degree
deg_in <- get_degree(x)
table(deg_in)

## compute out-degree
deg_out <- get_degree(x, "out")
barplot(table(deg_out), main = "Reproduction number distribution")
mtext(side = 3, "(based on case out-degree)")

}

}
\author{
Thibaut Jombart (\email{thibautjombart@gmail.com})
}

