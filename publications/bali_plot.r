library(hergm)
data(bali)
pdf("bali_plot.pdf")
gplot(bali, gmode="graph")
dev.off()

