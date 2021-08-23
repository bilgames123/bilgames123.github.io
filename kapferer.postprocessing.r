library(hergm)
library(mcgibbsit)

load("kapferer_2.RData")
d <- sample$network
n <- d$gal$n

mcgibbsit(processed.sample1$alpha)
mcgibbsit(processed.sample1$eta_mean)
mcgibbsit(processed.sample1$eta_precision)
mcgibbsit(processed.sample1$hergm_theta[,1:ncol(processed.sample1$hergm_theta)])
pdf("kapferer_alpha.pdf")
plot(processed.sample1$alpha, type="l", xlab="", ylab="", main="")
dev.off()
pdf("kapferer_eta_mean.pdf")
plot(processed.sample1$eta_mean[,1], type="l", xlab="", ylab="", main="")
dev.off()
pdf("kapferer_eta_precision.pdf")
plot(processed.sample1$eta_precision[,1], type="l", xlab="", ylab="", main="")
dev.off()
for (i in 1:ncol(processed.sample1$hergm_theta_min))
  {
  name <- paste("kapferer_", i, ".pdf", sep="")
  pdf(name)
  plot(processed.sample1$hergm_theta_min[,i], type="l", xlab="", ylab="", main="")
  dev.off()
  }
for (i in 1:ncol(processed.sample1$hergm_theta_min))
  {
  name <- paste("kapferer_density_", i, ".pdf", sep="")
  pdf(name)
  plot(density(processed.sample1$hergm_theta_min[,i]), xlim=c(-2.5, 0.5), type="l", xlab="", ylab="", main="")
  dev.off()
  }

pdf("kapferer_plot1.pdf")
network.vertex.names(processed.sample1$network) <- c(1:processed.sample1$network$gal$n)
hergm.plot(processed.sample1)
dev.off()
pdf("kapferer_plot2.pdf")
network.vertex.names(processed.sample2$network) <- c(1:processed.sample2$network$gal$n)
hergm.plot(processed.sample2)
dev.off()

