library(hergm)
library(mcgibbsit)

load("bunt_1.RData")
d <- sample$network
n <- d$gal$n

observed.degree <- summary(d ~ odegree(1:n-1)) # Degree distribution
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
observed.star <- summary(d ~ ostar(2))
observed.triangle <- summary(d ~ ttriple)
pdf("bunt_markov_gof_1.pdf")
boxplot(gof$distance[,1:9], main = "", xlab = "", ylab = "")
points(x = c(observed.distance[1:9]), col = "red", type = "b")
dev.off()
pdf("bunt_markov_gof_2.pdf")
boxplot(gof$degree[,1:n-1], main = "", xlab = "", ylab = "")
points(x = c(observed.degree[1:n-1]), col = "red", type = "b")
dev.off()
pdf("bunt_markov_gof_3.pdf")
hist(gof$edges, 50, prob = T, xlim = c(0, max(abs(gof$edges))), main = "", xlab = "", ylab = "")
abline(v = observed.edge, col = "red")
dev.off()
pdf("bunt_markov_gof_4.pdf")
hist(gof$stars, 50, prob = T, xlim = c(0, max(abs(gof$stars))), main = "", xlab = "", ylab = "")
abline(v = observed.star, col = "red")
dev.off()
pdf("bunt_markov_gof_5.pdf")
hist(gof$triangles, 50, prob = T, xlim = c(0, max(abs(gof$triangles))), main = "", xlab = "", ylab = "")
abline(v = observed.triangle, col = "red")
dev.off()

file <- paste("bunt_1_postprocessed.RData")
save(sample, processed.sample, gof, file = file)

