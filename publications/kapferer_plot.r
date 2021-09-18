library(hergm)
load("kapferer.RData")
pdf("kapferer_plot.pdf")
gplot(kapferer, gmode="graph", displaylabels=FALSE)
dev.off()

