##Task 1

#Import the normalExp and tumorExp datasets:

normalExp <- read.csv('normalExp.csv')
normalExp

tumorExp <- read.csv('tumorExp.csv')
tumorExp

#Check the type of normalExp and tumorExp: 
typeof(normalExp)
typeof(tumorExp)
#The type for "normalExp" and "tumorExp" is set to 'list'
c('Since the type is set to list, we can tell that it is a vector that contains 
      various objects necessary for the data analysis.')
c('It can also be inferred that this should be changed to a dataframe to promote 
      an easier analysis. With a dataframe, the rows and columns can be easily
      selected for analysis and tranformation.')
  

##Task 2    

#Convert the normalExp and tumorExp datasets into a DataFrame:
normalExpd <- data.frame(normalExp)
normalExpd

tumorExpd <- data.frame(tumorExp)
tumorExpd

#Now transpose the data frame to a proper format:

normalExpt <- t(normalExpd)
normalExpt

tumorExpt <- t(tumorExpd)
tumorExpt

#Select only the BRCA1 columns from each data set and assign them a new vector variable:
nBRCA1 <- normalExpt[,6]
nBRCA1

tBRCA1 <- tumorExpt[,6]
tBRCA1

#Calculate the mean, median, variance, and standard deviation of nBRCA1 and tBRCA1:
#Normal results
nBRCA1_mean <- mean(nBRCA1)
nBRCA1_mean
nBRCA1_median <- median(nBRCA1)
nBRCA1_median
nBRCA1_variance <- var(nBRCA1)
nBRCA1_variance
nBRCA1_std <- sqrt(var(nBRCA1))
nBRCA1_std

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
