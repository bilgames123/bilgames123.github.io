.libPaths("/local/rlibs")
library(hergm)

data(bali)
max_number <- 2
indicator <- c(1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1)

sample <- hergm(
     bali ~ edges_ij + triangle_ijk, 
     max_number = max_number, 
     indicator = indicator,
     seeds = 0.8640834893401168, 
     samplesize = 1e+6, 
     mh_scale = 0.25,
     predictions = TRUE
     )

processed.sample <- hergm.postprocess(
     sample = sample, 
     seeds = 0.8640834893401168, 
     burnin = 2e+3, 
     relabel = 0,
     number_runs = 10
     )

gof <- hergm.gof(processed.sample)

observed.triangles <- summary(bali ~ triangle)
msd <- sqrt(sum((gof$triangles - observed.triangles)^2) / length(gof$triangles))
print(msd)

file <- paste("bali_complete.RData", sep = "")
save(msd, file = file)

