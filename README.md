# Vignette-Random-Forests

Vignette on introduction to and implementation of random forest models for regression and classification cases; created as a class project for PSTAT197A in Fall 2023.

# Contributors

Contributors: Griffin Sheppard, Jackie Chen, Luis Barajas, Justin Kim and Rohan Anand

# Abstract

Vignette abstract: Our vignette topic is on random forests, specifically, building a predictive classification and regression model using random forest ensemble. We want to use these examples of random forest in the classification and regression setting to guide someone new to random forests through its applications. We used the titanic dataset for our classification example and the auto dataset for our regression model example.

The auto dataset consists of 392 observations on the following nine features:

-   Miles per gallon

-   Number of cylinders

-   Engine displacement

-   Horsepower

-   Vehicle weight

-   Acceleration

-   Year

-   Origin

-   Name

The titanic dataset consists of the following features for 891 passengers aboard the Titanic:

-   Passenger id

-   Survived (yes/no)

-   Passenger class

-   Name

-   Sex

-   Age

-   Sib_sp (number of siblings and spouses aboard)

-   Parch (number of parents and children aboard)

-   Ticket number

-   Ticket fare

-   Cabin number

# Project Description

For the auto dataset, the correlation matrix shows that there are several negative and positive correlations between the variables, including a negative correlation between cylinders and mpg and a positive correlation between cylinders and displacement. The best performing random forest model had 8 randomly sampled predictors, 300 trees, and a minimum of 10 data points in a node. The variable importance plot shows that the top three most influential predictors were displacement, weight, and horsepower with an RMSE around 2.

For the titanic dataset, the correlation matrix of all continuous random variables shows that there are several negative and positive correlations between the variables, including a negative correlation between age and sib_sp and a positive correlation between sib_sp and parch. The best random forest model had 1 randomly samplied predictor, 600 trees, and a minimum of 12 data points in a node. The variable importance plot shows that the top three most influential predictors were sex_male, the interaction between sex_male and fare, and fare. The performance metrics were 0.901 for the ROC AUC, 0.689 for the sensitivity, 0.976 for the specificity, and 0.866 for the accuracy.

Repository contents: The root directory is named Vignette-RandomForests, which consists of .gitignore, .RData, .Rhistory, README.md, Vignette-RandomForests.Rproj, vignette.html, vignette.qmd, as well as the folders data, images, scripts, and Vignette_files. The data folder consists of titanic_codebook.txt, titanic.csv, and tune_rf.rda. The scripts folder consists of AutoCorrplot.pdf, class_vignette_scratch.qmd, FinalProjectCarsRF.html, FinalProjectCarsRF.Rmd, method_scratch.qmd, titanic_code_example.R, titanic-work.R, and tune_auto.rda. The images folder consists of bkgrd-tree-ex.jpg, gini-index-formula.png, and toy-dataset2.png, while the Vignette_files folder consists of the folders figure-html and libs. The figure-html folder consists of unnamed-chunk-3-1.png, unnamed-chunk-6-1.png, unnamed-chunk-7-1.png, unnamed-chunk-14-1.png, unnamed-chunk-22-1.png, and unnamed-chunk-27-1.png, while the libs folder consists of the folders bootstrap, clipboard, and quarto-html. The bootstrap folder consists of bootstrap-icons.css, bootstrap-icons.woff, bootstrap.min.css, and bootstrap.min.js. The clipboard folder consists of clipboard.min.js, and the quarto-html folder consists of anchor.min.js, popper.min.js, quarto-syntax-highlighting.css, quarto.js, tippy.css, and tippy.umd.min.js.

# User Instructions

## Installation Instructions

Make sure you have the latest version of RStudio installed, and install/load the following packages: ranger, glmnet, vip, xgboost, ISLR, ISLR2, tidyverse, tidymodels, forcats, ggthemes, naniar, corrplot, corrr, klaR, ggplot2, and vip.

Below is the code to do so:

```{r, eval=FALSE}

install.packages(ISLR)
install.packages(ISLR2)
install.packages(tidyverse)
install.packages(tidymodels)
install.packages(forcats)
install.packages(ggthemes)
install.packages(naniar)
install.packages(corrplot)
install.packages(corrr)
install.packages(klaR)
install.packages(ggplot2)
install.packages(vip)
install.packages(ranger)
install.packages(xgboost)
install.packages(glmnet)

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
library(ggplot2)
library(vip)
library(ranger)
library(xgboost)
library(glmnet)

```

## Examples

Use the code examples and data sets provided in the qmd file in the home directory of the repository to use the project.


# References

Reference list: To learn more about random forests, check out these references listed below.

Shailey Dash. (2022). "Decision Trees Explained - Entropy, Information Gain, Gini Index, CCP Pruning." Towards Data Science. Available at: <https://towardsdatascience.com/decision-trees-explained-entropy-information-gain-gini-index-ccp-pruning-4d78070db36c>. This article provides an overview of decision trees, focusing on topics like Entropy, Information Gain, Gini Index, and CCP Pruning.

Carolina Bento. (2021). "Random Forests Algorithm Explained with a Real-Life Example and Some Python Code." Towards Data Science. Available at: <https://towardsdatascience.com/random-forests-algorithm-explained-with-a-real-life-example-and-some-python-code-affbfa5a942c>. This article explains the Random Forests algorithm, and includes a practical example along with Python code to demonstrate its application.

Steven Loaiza. (2020). "Entropy and Information Gain." Towards Data Science. Available at: <https://towardsdatascience.com/entropy-and-information-gain-b738ca8abd2a>. This source discusses concepts such as Entropy and Information gain.

Jason Brownlee. (2023). "A Gentle Introduction to k-fold Cross-Validation." Machine Learning Mastery. Available at: <https://machinelearningmastery.com/k-fold-cross-validation>. This article provides a comprehensive introduction to k-fold cross validation.
