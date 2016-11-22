



Welcome to the *epicontacts* package!
---------------------------------------

<br>

[![Travis-CI Build Status](https://travis-ci.org/reconhub/epicontacts.svg?branch=master)](https://travis-ci.org/reconhub/epicontacts)

[![Coverage Status](https://img.shields.io/codecov/c/github/reconhub/epicontacts/master.svg)](https://codecov.io/github/reconhub/epicontacts?branch=master)

[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/epicontacts)](https://cran.r-project.org/package=epicontacts)




<br>
<br>

# Installing the package

To install the current stable, CRAN version of the package, type:

```r
install.packages("epicontacts")
```

To benefit from the latest features and bug fixes, install the development, *github* version of the package using:

```r
devtools::install_github("reconhub/epicontacts")
```

Note that this requires the package *devtools* installed.



<br>
<br>



# What does it do?

The main features of the package include:

* **`epi_contacts`:** a new S3 class for storing linelists and contacts data

* **`make_epi_contacts`:** a constructor for the new `epi_contacts` class

* **`get_id`:** access unique IDs in an `epi_contacts` with various options

* **`get_pairwise`**:  extract attributes of record(s) in contacts database using information provided in the linelist data of an `epi_contacts` object.

* **`get_degree`:** access degree of cases in `epi_contacts` with various options

* **`x[i,j,contacts]`:** subset an `epi_contacts` object by retaining specified cases

* **`summary`:** summary for  `epi_contacts` objects

* **`plot`:** plot for  `epi_contacts` objects; various types of plot are available; default to `vis_epi_contacts`

* **`vis_epi_contacts`:** plot an `epi_contacts` object using `visNetwork
`
* **`as.igraph.epi_contacts`:** create an `igraph` object from a epi_contacts object

* **`clusters_epi_contacts`:** assign clusters and corresponding cluster sizes to linelist of an epi_contacts object (clusters being groups of connected individuals/nodes).

* **`subset_clusters_by_id`**: subset an `epi_contacts` object based on a IDs of cases of interest.

* **`subset_clusters_by_size`**:  subset an `epi_contacts` object based on size(s) of clusters (clusters being groups of connected individuals/nodes).

* **`graph3D`**: 3D graph from an `epi_contacts` object.

* **`epicontacts_server`**: run the epicontacts Shiny app on a local host




<br>
<br>

# Resources

<br>

## Vignettes

An overview of *epicontacts* is provided below in the worked example below.
More detailed tutorials are distributed as vignettes with the package:

```r
vignette(package="epicontacts")
#> Vignettes not found
```

To open these, type:

```r
vignette("overview", package="epicontacts")
vignette("customize_plot", package="epicontacts")
vignette("epicontacts_class", package="epicontacts")
```

<br>
<br>

## Websites

The following websites are available:

- The official *epicontacts* website, providing an overview of the package's functionalities, up-to-date tutorials and documentation: <br>
[http://www.repidemicsconsortium.org/epicontacts/](http://www.repidemicsconsortium.org/epicontacts/)

- The *epicontacts* project on *github*, useful for developers, contributors, and users wanting to post issues, bug reports and feature requests: <br>
[http://github.com/reconhub/epicontacts](http://github.com/reconhub/epicontacts)

- The *epicontacts* page on CRAN: <br>
[https://CRAN.R-project.org/package=epicontacts](https://CRAN.R-project.org/package=epicontacts)


<br>
<br>

## Getting help online

Bug reports and feature requests should be posted on *github* using the [*issue*](http://github.com/reconhub/epicontacts/issues) system. All other questions should be posted on the **RECON forum**: <br>
[http://www.repidemicsconsortium.org/forum/](http://www.repidemicsconsortium.org/forum/)





<br>
<br>

# A quick overview

The following worked example provides a brief overview of the package's
functionalities. See the [*vignettes section*](#vignettes) for more detailed tutorials.

## Loading the data

... to be continued!






<br>
<br>

# Contributors (by alphabetic order):
- [Thomas Crellen](https://github.com/tc13)
- [Finlay Campbell](https://github.com/finlaycampbell)
- [Thibaut Jombart](https://github.com/thibautjombart)
- [Nistara Randhawa](https://github.com/nistara)
- Bertrand Sudre


See details of contributions on: <br>
https://github.com/reconhub/epicontacts/graphs/contributors



Contributions are welcome via **pull requests**.

Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.

**Maintainer:** VP Nagraj (vpnagraj@virginia.edu)
