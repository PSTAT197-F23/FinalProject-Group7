library(ISLR)
library(ISLR2)
library(tidyverse)
library(tidymodels)
library(forcats)
library(ggthemes)
library(naniar)
library(corrplot)
library(corrr)
library(klaR)

tidymodels_prefer()

titanic_data <- read.csv('data/titanic.csv')

titanic_data_1 <- titanic_data %>% 
  mutate(survived = factor(survived, levels = c("Yes", "No"))) %>% 
  mutate(pclass = factor(pclass))



# Training and Testing Split
set.seed(3435)
tit_split <- initial_split(titanic_data_1, strata = survived, prop = 0.7)
tit_train <- training(tit_split)
tit_test <- testing(tit_split)


# k-fold cross validation sets (reference link)

tit_folds <- vfold_cv(tit_train, v = 5, strata = "survived")



# Visualize Missingness (explain on the spot)
vis_miss(tit_train)


# Justify Stratification (explain on the spot)
tit_train %>% 
  ggplot(aes(x = survived)) + 
  geom_bar()




# Correlation Matrix of all continuous variables (reference for interaction terms)

tit_train %>% 
  select(where(is.numeric)) %>% 
  cor(use = 'pairwise.complete.obs') %>% 
  corrplot(type = 'lower', diag = FALSE,
           method = 'color')



tit.recipe <- recipe(survived ~ pclass + sex + age + sib_sp + parch + fare, data = tit_train) %>% 
  step_impute_linear(age,
                     impute_with = imp_vars(fare)) %>% 
  step_dummy(all_nominal_predictors()) %>% 
  step_interact(terms = ~ starts_with('sex'):fare + age:fare)




#random forest model/workflow creation and tuning grid initialization

rf_class_spec <- rand_forest(mtry = tune(),
                             trees = tune(),
                             min_n = tune()) %>% 
  set_engine("ranger", importance = "impurity") %>% 
  set_mode("classification")

rf_class_wf <- workflow() %>% 
  add_model(rf_class_spec) %>% 
  add_recipe(tit.recipe)

rf_grid <- grid_regular(mtry(range = c(1, 3)),
                        trees(range = c(200, 600)),
                        min_n(range = c(10, 20)),
                        levels = 8)




#tuning the random forest model

tune_rf <- tune_grid(
  rf_class_wf,
  resamples = tit_folds,
  grid = rf_grid
)


autoplot(tune_rf)



#Extract the best performing random forest model (roc_auc)

best_rf <- select_best(tune_rf)

rf_final <- finalize_workflow(rf_class_wf, best_rf)

rf_final_fit <- fit(rf_final, data = tit_train)



#Evaluate the model's performance on the testing set


augment(rf_final_fit, new_data = tit_test) %>% 
  roc_auc(survived, .pred_Yes)

augment(rf_final_fit, new_data = tit_test) %>% 
  sensitivity(survived, .pred_class)

augment(rf_final_fit, new_data = tit_test) %>% 
  specificity(survived, .pred_class)

augment(rf_final_fit, new_data = tit_test) %>% 
  accuracy(survived, .pred_class)


# Extract Variables of Importance

library(vip)

rf_final_fit %>% extract_fit_parsnip() %>% 
  vip() + 
  theme_classic()

# Gini Coefficient (impurity)





