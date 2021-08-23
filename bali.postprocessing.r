library(hergm)
library(mcgibbsit)

load("bali_5.RData")
d <- sample$network
n <- d$gal$n

mcgibbsit(processed.sample1$alpha)
mcgibbsit(processed.sample1$eta_mean)
mcgibbsit(processed.sample1$eta_precision)
mcgibbsit(processed.sample1$hergm_theta[,1:ncol(processed.sample1$hergm_theta)])
pdf("bali_alpha.pdf")
plot(processed.sample1$alpha, type="l", xlab="", ylab="", main="")
dev.off()
pdf("bali_eta_mean_1.pdf")
plot(processed.sample1$eta_mean[,1], type="l", xlab="", ylab="", main="")
dev.off()
pdf("bali_eta_mean_2.pdf")
plot(processed.sample1$eta_mean[,2], type="l", xlab="", ylab="", main="")
dev.off()
pdf("bali_eta_precision_1.pdf")
plot(processed.sample1$eta_precision[,1], type="l", xlab="", ylab="", main="")
dev.off()
pdf("bali_eta_precision_2.pdf")
plot(processed.sample1$eta_precision[,2], type="l", xlab="", ylab="", main="")
dev.off()
for (i in 1:ncol(processed.sample1$hergm_theta_min))
  {
  name <- paste("bali_", i, ".pdf", sep="") 
  pdf(name) 
  plot(processed.sample1$hergm_theta_min[,i], type="l", xlab="", ylab="", main="")
  dev.off()
  }
pdf("bali_eta_mean_density_1.pdf")
plot(density(processed.sample1$eta_mean[,1]), type="l", xlab="", ylab="", main="")
dev.off()
pdf("bali_eta_mean_density_2.pdf")
plot(density(processed.sample1$eta_mean[,2]), type="l", xlab="", ylab="", main="")
dev.off()

pdf("bali_clustering_1.pdf")
hergm.plot(processed.sample1)
dev.off()
pdf("bali_clustering_2.pdf")
hergm.plot(processed.sample2)
dev.off()

load("bali_5_postprocessed.RData")
#gof <- hergm.gof(processed.sample1)
observed.degree <- summary(d ~ degree(1:n-1)) # Degree distribution
observed.components <- component.dist(d)
observed.component.number <- length(observed.components$csize) # Number of components
observed.max.component.size <- max(observed.components$csize) # Size of largest component
observed.distances <- geodist(d)
observed.distances <- observed.distances$gdist
observed.frequencies_distances <- table(observed.distances) # First column: frequency of self loops; columns 2:number: frequencies finite and (last column) infinite distances
number <- length(observed.frequencies_distances) - 1 - (sum(observed.distances == Inf) > 0) # Number of distances minus 0-distance minus Inf-distance
observed.distance.label <- rownames(observed.frequencies_distances)[2:(number+1)]
observed.distance <- observed.frequencies_distances[2:(number+1)] # Frequencies of finite distances
observed.edge <- summary(d ~ edges)
observed.star <- summary(d ~ kstar(2))
observed.triangle <- summary(d ~ triangle)
pdf("bali_gof_1.pdf")
boxplot(gof$distance[,1:9], main = "", xlab = "", ylab = "")
points(x = c(observed.distance[1:9]), col = "red", type = "b")
dev.off()
pdf("bali_gof_2.pdf")
boxplot(gof$degree[,1:n-1], main = "", xlab = "", ylab = "")
points(x = c(observed.degree[1:n-1]), col = "red", type = "b")
dev.off()
pdf("bali_gof_3.pdf")
hist(gof$edges, 50, prob = T, xlim = c(0, max(abs(gof$edges))), main = "", xlab = "", ylab = "")
abline(v = observed.edge, col = "red")
dev.off()
pdf("bali_gof_4.pdf")
hist(gof$stars, 50, prob = T, xlim = c(0, max(abs(gof$stars))), main = "", xlab = "", ylab = "")
abline(v = observed.star, col = "red")
dev.off()
pdf("bali_gof_5.pdf")
hist(gof$triangles, 50, prob = T, xlim = c(0, max(abs(gof$triangles))), main = "", xlab = "", ylab = "")
abline(v = observed.triangle, col = "red")
dev.off()

file <- paste("bali_5_postprocessed.RData")
save(sample, processed.sample, processed.sample1, processed.sample2, gof, file = file)

