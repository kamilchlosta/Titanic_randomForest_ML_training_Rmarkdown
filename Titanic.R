library(dplyr)
library(ggplot2)

setwd('C:/Users/Kamil Chłosta/Desktop/Kaggle/Titanic')
train <- read.csv("Data/train.csv")


train$Sex <- as.factor(train$Sex)
train$Pclass <- as.factor(train$Pclass)
train$Embarked <- as.factor(train$Embarked)
train$Survived <- as.factor(train$Survived)

train %>% summary()

ggplot(train, aes(x = Sex, fill = Survived))+
  geom_bar(aes(y = ..count..))+
  geom_text(stat='count', aes(label=..count..), vjust=-0.5, alpha = 0.5)+
  theme_minimal()+
  labs(subtitle = "Survival by sex")

ggplot(train, aes(x=Age, fill = Sex)) + 
  geom_density(alpha = 0.5)+
  theme_minimal()+
  labs(subtitle = "Age distribution by sex")

ggplot(train %>% filter(Sex == "male"), aes(x=Age, fill = Survived)) + 
  geom_histogram(alpha = 0.4, binwidth = 2)+
  theme_minimal()+
  scale_fill_brewer(palette="Dark2")+
  labs(subtitle = "Male survival by age")

ggplot(train %>% filter(Sex == "female"), aes(x=Age, fill = Survived)) + 
  geom_histogram(alpha = 0.4, binwidth = 2)+
  theme_minimal()+
  scale_fill_brewer(palette="Dark2")+
  labs(subtitle = "Female survival by age")

ggplot(train, aes(x=Age, fill = Survived)) + 
  geom_histogram(alpha = 0.4, binwidth = 2)+
  theme_minimal()+
  scale_fill_brewer(palette="Dark2")+
  labs(subtitle = "Survival by age")
