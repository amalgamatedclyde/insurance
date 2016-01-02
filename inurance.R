setwd( "/home/clyde/insurance")
library(data.table)
train <- fread('train.csv')
train <- data.frame(train)
train <- data.frame(train)
train$PersonalField84 <- NULL
train$PropertyField29 <- NULL
train.numerical <- train[,sapply(train,is.integer)]
train.numerical <- train[,sapply(train, )]
# train.bin <- train.numerical[,sapply(train.numerical, function (x) all(x%in%0:1))]  
# bin.idx <- which(names(train)%in%names(train.bin))
train2 <- train
# train2[,bin.idx] <- lapply(train2[,bin.idx], as.factor)
train.values <- sapply(train.numerical, unique)
factors <- sapply(train.values, length)
factors <- train.values[factors<31]
factor.idx <- which(names(train)%in%names(factors))
train2[,factor.idx] <- lapply(train2[,factor.idx], as.factor)
train.character <- train2[,sapply(train2,is.character)]
char.len <- (lapply(train.character, unique))
char.len <- (lapply(char.len, length))
char.idx <- which(names(train2)%in%names(train.character))
train2[,char.idx] <- lapply(train2[,char.idx], as.factor)
set.seed(314159)
include <- sample(c(FALSE, TRUE), nrow(train2), replace = T, prob = c(.1,.9))
# train.valid <- sample_frac(train2, size = .9)
train.valid <- train2[include,]
test<- train2[!include,]
include <- sample(c(FALSE, TRUE), 234678, replace = T, prob = c(.4,.6))
train.set <- train.valid[include,]
valid.set <- train.valid[!include,]
train.set <- train.set[,-c(1:2)]
valid.set <- valid.set[,-c(1:2)]
factors <- sapply(names(train.set), function(name) is.factor(train.set[[name]]))
b <- train.set[,which(names(train.set) %in% names(factors))]
counts <- sapply(names(b), function(name) length(levels(train.set[[name]]))<2)
c <- b[,-which(counts==TRUE)]
# b <- apply(train.set, 2, unique)
# b
# onesies <- b[b==1]
# remover <- which(names(train.set) %in% names(onesies))
# remover <- remover[-which(remover==3)] 
# model1.set <- train.set[,-remover]
# shorties <- sapply(sapply(model1.set, levels), length)
# remover <- names(shorties[shorties<2])
# model1.set <- model1.set[ , -which(names(model1.set) %in% remover)]
# nas <- sapply(model1.set, function(x) any(is.na(x)))
# # PersonalField84 PropertyField29 
# # TRUE            TRUE 
# 
