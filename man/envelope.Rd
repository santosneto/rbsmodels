% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/envelopes.R
\name{envelope}
\alias{envelope}
\title{Simulated Evelope}
\usage{
envelope(model,k=19,alpha=0.05,res="deviance", precision = c("fixed","varying"),
dist = RBS(mu.link = "identity",sigma.link = "identity") )
}
\arguments{
\item{model}{object of class \code{gamlss} holding the fitted model.}

\item{k}{number of replications for envelope construction. Default is 19.}

\item{alpha}{value giving the size of the envelope. Default is 0.05 which is equivalent to a 95\% band.}

\item{res}{type of residuals to be extracted. Default is deviance.}

\item{precision}{If \code{precision = "fixed"} a model with precision fixed is used;
else a model with precision variable is used.}

\item{dist}{The function RBS() defines the RBS distribution.}
}
\value{
A simulated envelope of the class RBS.
}
\description{
A normal plot with simulated envelope of the residual is produced.
}
\examples{

## Fixed Precision
library(faraway)
data(cpd)
attach(cpd)
model0 = gamlss(actual ~ projected, family=RBS(mu.link="identity"),method=CG())
summary(model0)
set.seed(2015)
envelope(model0)
model = gamlss(actual ~ 0+projected, family=RBS(mu.link="identity"),method=CG())
summary(model)
set.seed(2015)
envelope(model)

##
library(alr3)
data(landrent)
attach(landrent)
resp <- I(Y/X1)
y1 <-  split(resp, X4)$"1"
x21 <-  split(X2, X4)$"1"

##Fixed Precision
fit0 <- gamlss(y1 ~ x21, family=RBS(mu.link="identity"),method=CG()  )
summary(fit0)
set.seed(2015)
envelope(fit0,alpha=0.01, precision="fixed",res="quantile",dist=RBS(mu.link="identity"))
##Varying Precision
fit1 <- gamlss(y1 ~ x21,sigma.formula = y1 ~x21, family=RBS(mu.link="identity",sigma.link="sqrt"),method=CG()  )
summary(fit11)
set.seed(2015)
envelope(fit1,alpha=0.01, precision="varying",res="quantile",dist=RBS(mu.link="identity",sigma.link="sqrt"))
}
\author{
Manoel Santos-Neto \email{manoel.ferreira@ufcg.edu.br}, F.J.A. Cysneiros \email{cysneiros@de.ufpe.br}, Victor Leiva \email{victorleivasanchez@gmail.com} and Michelli Barros \email{michelli.karinne@gmail.com}
}
\references{
Atkinson, A. C. (1985) Plots, transformations and regression : an introduction to graphical methods of diagnostic regression analysis. Oxford Science Publications, Oxford.
}

