# Data exploration
library(tidyverse)
library(data.table)

df <- fread("glass.csv")
ggplot(df %>% gather(key=variable, value=value), aes(x=value)) + geom_histogram() + facet_wrap(~variable, scales = "free")

# install.packages("corrgram")
library(corrgram)
corrgram(df %>% select(-Type))

names(df)
pca <- stats::prcomp(~ RI + Na + Mg + Al + Si + K + Ca + Ba + Fe,df, center=TRUE, scale. =TRUE)
plot(pca)
biplot(pca)
# From the looks of the pca plot, it seems as though 
# the variance isn't sufficiently explained by the first
# few principal components
print(pca$sdev)

#   install.packages("caret")
library(caret)






