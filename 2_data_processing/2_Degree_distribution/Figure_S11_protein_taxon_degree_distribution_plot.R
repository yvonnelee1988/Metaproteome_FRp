# Plot degree distributions
library("igraph")
library(ggpubr)
library(ggplot2)

# Plot degree distribution for all samples
# Function_degree_distribution
mydir = "Function"
myfiles = list.files(path=mydir, pattern="*.csv", full.names=TRUE)
Function_degree_distribution <- vector(mode = "list", length = 8)

for (i in 1:length(myfiles)) {
  data <- read.csv(myfiles[i], header = T)[, -1]
  Function_degree_distribution[[i]] <- ggplot(data, aes(x=k, y=pk)) + geom_point(size=2, shape=21, color = "#5B8773") + scale_x_log10() + scale_y_log10() +
    labs(y = expression(paste(italic("P"), "(", italic(kappa)["Ortholog"], ")")),
         x = expression(italic(kappa)["Ortholog"])) + theme_bw() +
    theme(
      plot.title = element_text(color="black", size=14, face="bold"),
      axis.title.x = element_text(color="black", size=15, face="bold"),
      axis.title.y = element_text(color="black", size=15, face="bold"),
      axis.text.x = element_text(size=12),
      axis.text.y = element_text(size=12)
    )
  #ggsave(paste0(myfiles[i],".pdf"), width=2.5, height=2.5) # degree distributions plots saved to the same folder
}

# Genus degree distribution
mydir = "Taxon"
myfiles = list.files(path=mydir, pattern="*.csv", full.names=TRUE)
genome_degree_distribution <- vector(mode = "list", length = 8)

for (i in 1:length(myfiles)) {
  data <- read.csv(myfiles[i], header = T)[, -1]
  genome_degree_distribution[[i]] <- ggplot(data, aes(x=k, y=pk)) +
    geom_histogram(aes(y = (..count..)/sum(..count..)), binwidth=0.5, fill = "#1B9E77", color = "black", alpha=0.7) + scale_x_log10() +
    labs(y = expression(paste(italic("P"), "(", italic(kappa)["Genus"], ")")),
         x = expression(italic(kappa)["Genus"]))+ theme_bw() +
    theme(
      plot.title = element_text(color="black", size=14, face="bold"),
      axis.title.x = element_text(color="black", size=15, face="bold"),
      axis.title.y = element_text(color="black", size=15, face="bold"),
      axis.text.x = element_text(size=12),
      axis.text.y = element_text(size=12)
    )
  #ggsave(paste0(myfiles[i],".pdf"), width=4, height=4) # degree distributions plots saved to the same folder
} 

ggarrange(genome_degree_distribution[[1]], genome_degree_distribution[[2]], genome_degree_distribution[[3]], genome_degree_distribution[[4]],
          ncol = 4, nrow = 1)
 
ggarrange(Function_degree_distribution[[1]], Function_degree_distribution[[2]], Function_degree_distribution[[3]], Function_degree_distribution[[4]],
          ncol = 4, nrow = 1)

ggarrange(
          Function_degree_distribution[[1]], Function_degree_distribution[[2]],
          Function_degree_distribution[[3]], Function_degree_distribution[[4]],
          genome_degree_distribution[[1]], genome_degree_distribution[[2]],
          genome_degree_distribution[[3]], genome_degree_distribution[[4]],
          ncol = 4, nrow = 2, align = "v")

ggsave("PCN_degree_distributions.pdf", width = 10, height = 4)



