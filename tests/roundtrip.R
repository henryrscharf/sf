#library(rgdal2)
#openOGRLayer("PG:dbname=postgis" , "meuse2")

suppressPackageStartupMessages(library(sf))
options(rgdal_show_exportToProj4_warnings = "none")
outer = matrix(c(0,0,10,0,10,10,0,10,0,0),ncol=2, byrow=TRUE)
hole1 = matrix(c(1,1,1,2,2,2,2,1,1,1),ncol=2, byrow=TRUE)
hole2 = matrix(c(5,5,5,6,6,6,6,5,5,5),ncol=2, byrow=TRUE)
pol1 = list(outer, hole1, hole2)
pol2 = list(outer + 12, hole1 + 12)
pol3 = list(outer + 24)
mp = list(pol1,pol2,pol3)
mp1 = st_multipolygon(mp)
sf = st_sf(a=1, st_sfc(mp1))
if (require(sp, quietly = TRUE)) {
 a = as(sf, "Spatial")
 print(class(a))
 b = st_as_sf(a)
 a2 = as(a, "SpatialPolygonsDataFrame")
 print(all.equal(a, a2)) # round-trip

 b1 = as(a, "sf")
 print(all.equal(b, b1))
 b = st_as_sfc(a)
 b1 = as(a, "sfc")
 print(all.equal(b, b1))
}

# SpatialMultiPoints
if (require(sp, quietly = TRUE)) {
suppressWarnings(RNGversion("3.5.3"))
set.seed(1331)
# example(SpatialMultiPoints, ask = FALSE, echo = FALSE) # loads mpdf
cl1 = cbind(rnorm(3, 10), rnorm(3, 10))
cl2 = cbind(rnorm(5, 10), rnorm(5,  0))
cl3 = cbind(rnorm(7,  0), rnorm(7, 10))
mpdf = SpatialMultiPointsDataFrame(list(a=cl1, b=cl2, c=cl3), data.frame(a = 1:3, row.names=c("a", "b", "c")))
m = st_as_sf(mpdf)
all.equal(as(m, "Spatial"), mpdf) # TRUE

demo(meuse, ask = FALSE, echo = FALSE)
#meuse = spTransform(meuse, CRS("+proj=longlat +ellps=WGS84 +no_defs"))
pol.grd = as(meuse.grid, "SpatialPolygonsDataFrame")
#meuse.grd = spTransform(meuse.grid, CRS("+proj=longlat +ellps=WGS84 +no_defs"))
#pol.grd = spTransform(pol.grd, CRS("+proj=longlat +ellps=WGS84 +no_defs"))
#meuse.area = spTransform(meuse.area, CRS("+proj=longlat +ellps=WGS84 +no_defs"))
#meuse.riv = spTransform(meuse.riv, CRS("+proj=longlat +ellps=WGS84 +no_defs"))
#summary(st_as_sf(meuse))
#summary(st_as_sf(meuse.grd))
#x <- st_as_sf(meuse.grid) # don't print: CRS variations.
#summary(st_as_sf(meuse.area))
#summary(st_as_sf(meuse.riv))
#summary(st_as_sf(as(meuse.riv, "SpatialLines")))
#summary(st_as_sf(pol.grd))
#summary(st_as_sf(as(pol.grd, "SpatialLinesDataFrame")))

nc = st_read(system.file("gpkg/nc.gpkg", package="sf"), "nc.gpkg", quiet = TRUE)
all.equal(nc, st_as_sf(as(nc, "Spatial")))
st_crs(nc) == st_crs(st_as_sf(as(nc, "Spatial")))

detach("package:sp")
}
