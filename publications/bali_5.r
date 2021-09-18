.libPaths("/local/rlibs")
library(hergm)

data(bali)
max_number <- 5
indicator <- NULL

sample <- hergm(
     bali ~ edges_ij + triangle_ijk, 
     max_number = max_number, 
     indicator = indicator,
     seeds = 0.8640834893401168, 
     samplesize = 1e+6, 
     mh_scale = 0.25,
     variational = TRUE,
     predictions = TRUE,
     )

network.vertex.names(sample$network) <- c(1:sample$network$gal$n)

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

pdf("bali_plot1.pdf")
processed.sample1 <- hergm.postprocess(
     sample = sample,
     seeds = 0.8640834893401168,
     burnin = 2e+3,
     relabel = 1,
     number_runs = 10
     )
hergm.plot(processed.sample1)
dev.off()

pdf("bali_plot2.pdf")
processed.sample2 <- hergm.postprocess(
     sample = sample,
     seeds = 0.8640834893401168,
     burnin = 2e+3,
     relabel = 2,
     number_runs = 10
     )
hergm.plot(processed.sample2)
dev.off()

file <- paste("bali_", max_number, ".RData", sep = "")
save(sample, processed.sample, processed.sample1, processed.sample2, gof, msd, file = file)

