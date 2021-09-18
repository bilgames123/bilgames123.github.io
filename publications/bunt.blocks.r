load("bunt_10.RData")
sample_size <- processed.sample$sample_size
sizes <- processed.sample$size
number <- vector(length=sample_size)
for (i in 1:sample_size)
  {
  number[i] <- sum(sizes[i,] > 0)
  }
pdf("bunt_blocks.pdf")
hist(number, xlim=c(1, 10), xlab = "", ylab = "", main = "")
dev.off()

