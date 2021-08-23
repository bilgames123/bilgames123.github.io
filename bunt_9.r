.libPaths("/local/rlibs")
library(hergm)

y <- read.table("VRND32T6.DAT")
y <- as.matrix(y)
y[,] <- (y[,] %in% c(1, 2)) # Indicator of 1="best friend" or 2="friend"
y <- as.network(y, directed=TRUE)
max_number <- 9

sample <- hergm(
     y ~ edges_ij + mutual_ij + ttriple_ijk,
     max_number = max_number,
     seeds = 0.8640834893401168,
     samplesize = 1e+6,
     mh_scale = 0.25,
     variational = TRUE,
     predictions = TRUE,
     )

processed.sample <- hergm.postprocess(
     sample = sample,
     seeds = 0.8640834893401168,
     burnin = 2e+3,
     relabel = 0,
     number_runs = 10
     )

gof <- hergm.gof(processed.sample)
observed.triangles <- summary(y ~ ttriple)
msd <- sqrt(sum((gof$triangles - observed.triangles)^2) / length(gof$triangles))
print(msd)

file <- paste("bunt_", max_number, ".RData", sep = "")
save(sample, processed.sample, gof, msd, file = file)

