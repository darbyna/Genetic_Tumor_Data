#Better visuals for the normal BRCA1 statistics:

normal_BRCA1_stats = data.frame(nBRCA1_mean, nBRCA1_median, nBRCA1_variance, nBRCA1_std)
colnames(normal_BRCA1_stats) <- c('Mean', 'Median', 'Variance', 'Standard Deviation')
normal_BRCA1_stats



#Tumor results
tBRCA1_mean <- mean(tBRCA1)
tBRCA1_mean
tBRCA1_median <- median(tBRCA1)
tBRCA1_median
tBRCA1_variance <- var(tBRCA1)
tBRCA1_variance
tBRCA1_std <- sqrt(var(tBRCA1))
tBRCA1_std

#Better visuals for the tumor BRCA1 statistics: 

tumor_BRCA1_stats = data.frame(tBRCA1_mean, tBRCA1_median, tBRCA1_variance, tBRCA1_std)
colnames(tumor_BRCA1_stats) <- c('Mean', 'Median', 'Variance', 'Standard Deviation')
tumor_BRCA1_stats


#Now calculate the means of all genes of both data sets and create a new data frame of all results:
norMean <- colMeans(normalExpt)
norMean
tuMean <- colMeans(tumorExpt)
tuMean

NorTuMean <- data.frame(norMean, tuMean)
NorTuMean

#Save the NorTuMean dataframe as a csv file: 
write.csv(NorTuMean, 'NormalvTumorMean.csv')

#As a bonus, make a bar plot of the two columns in NorTuMean:
genes <-  c('EGFR', 'KLF6', 'FOX01', 'KRAS', 'JAK2', 'BRCA1', 'BRCA2', 'PPM1D')
barplot(t(matrix(c(NorTuMean$norMean, NorTuMean$tuMean), nc=2)), col = c(rgb(0.1,0.9,0.1,0.9),rgb(0.9,0.4,0.9,0.9)), beside = T, main = 'Mean of Normal and Tumor Genes', ylab = 'Average of Each Gene', names.arg = genes)
legend("topright", c('Normal', 'Tumor'), pch = 15, col = c(rgb(0.1,0.9,0.1,0.9),rgb(0.9,0.4,0.9,0.9)), bty = 'n' )
