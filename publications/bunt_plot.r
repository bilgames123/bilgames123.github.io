library(hergm)
y <- read.table("VRND32T6.DAT")
y <- as.matrix(y)
y[,] <- (y[,] %in% c(1, 2)) # Indicator of 1="best friend" or 2="friend"
y <- as.network(y, directed=TRUE)
pdf("bunt_plot.pdf")
gplot(y, displaylabels=FALSE)
dev.off()

