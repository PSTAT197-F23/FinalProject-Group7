# Install and load required libraries
install.packages(c("ISLR", "tune", "randomForest"))
library(ISLR)
library(tune)
library(randomForest)

# Load auto dataset
data(auto)

# Create a tuning grid for decision tree
tree_grid <- expand.grid(cp = seq(0.01, 0.1, by = 0.01))

# Perform hyperparameter tuning for decision tree
tree_tune <- tune.rpart(mpg ~ horsepower + weight + displacement, data = auto, 
                        ranges = list(cp = seq(0.01, 0.1, by = 0.01)),
                        control = rpart.control(cp = 0), 
                        tunecontrol = tune.control(sampling = "cross", cross = 5))

# Print best hyperparameter
best_tree <- tree_tune$best.parameters
print(best_tree)

# Train decision tree with the best hyperparameter
decision_tree_model <- rpart(mpg ~ horsepower + weight + displacement, data = auto, cp = best_tree$cp)

# Plot the decision tree
plot(decision_tree_model)
text(decision_tree_model, cex = 0.8)

# Create a tuning grid for random forest
rf_grid <- expand.grid(mtry = c(2, 3, 4))

# Perform hyperparameter tuning for random forest
rf_tune <- tune.randomForest(mpg ~ horsepower + weight + displacement, data = auto,
                             ranges = list(mtry = c(2, 3, 4)),
                             ntrees = 500,
                             tunecontrol = tune.control(sampling = "cross", cross = 5))

# Print best hyperparameter
best_rf <- rf_tune$best.parameters
print(best_rf)

# Train random forest with the best hyperparameter
random_forest_model <- randomForest(mpg ~ horsepower + weight + displacement, data = auto, mtry = best_rf$mtry, ntree = 500)

# Print the random forest model
print(random_forest_model)

# Make predictions on the training set
predictions <- predict(random_forest_model, auto)

# Print a summary of predictions
head(predictions)