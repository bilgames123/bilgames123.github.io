#.libPaths("/local/rlibs")
library(hergm)

load("kapferer.RData")
y <- kapferer
max_number <- 2

sample <- hergm(
     y ~ edges_i,
     max_number = max_number,
     parametric = TRUE,
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

pdf("kapferer_plot1.pdf")
processed.sample1 <- hergm.postprocess(
     sample = sample,
     seeds = 0.8640834893401168,
     burnin = 2e+3,
     relabel = 1,
     number_runs = 10
     )
hergm.plot(processed.sample1)
dev.off()

pdf("kapferer_plot2.pdf")
processed.sample2 <- hergm.postprocess(
     sample = sample,
     seeds = 0.8640834893401168,
     burnin = 2e+3,
     relabel = 2,
     number_runs = 10
     )
hergm.plot(processed.sample2)
dev.off()

file <- paste("kapferer_", max_number, ".RData", sep = "")
save(sample, processed.sample, processed.sample1, processed.sample2, gof, msd, file = file)

