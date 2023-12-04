# load libraries
library(tidymodels)
library(ISLR)
library(ISLR2)
library(tidyverse)
library(glmnet)
library(modeldata)
library(ggthemes)
library(janitor)
library(naniar)
library(ranger)
library(vip)
library(corrplot)
tidymodels_prefer()

# read in the titanic data
titanic_data <- read.csv("~/Desktop/Academics/Past classes/PSTAT 131/homework-3/data/titanic.csv")

# convert survived and pclass into factors
titanic_data_1 <- titanic_data %>%
  mutate(survived = factor(survived, levels=c("Yes", "No"))) %>%
  mutate(pclass=factor(pclass))

# split into training and testing datasets
set.seed(3435)
titanic_split <- initial_split(titanic_data_1, strata = "survived")

titanic_train <- training(titanic_split)
titanic_test <- testing(titanic_split)

titanic_folds <- vfold_cv(titanic_train, v = 5, strata = "survived")

vis_miss(titanic_train) # most data not missing, age and cabin have the most missing data

# creating the recipe for titanic training data
rec_titanic <- recipe(survived ~ pclass + sex + age + sib_sp + parch + fare, data = titanic_train) %>% 
  step_dummy(all_nominal_predictors()) %>% 
  step_normalize(all_predictors())

