# Vignette-Random-Forests

Vignette on introduction to and implementation of random forest models for regression and classification cases; created as a class project for PSTAT197A in Fall 2023.

Contributors: Griffin Sheppard, Jackie Chen, Luis Barajas, Justin Kim and Rohan Anand

Vignette abstract: a brief description in a few sentences of your vignette topic, example data, and outcomes. Our vignette topic is on random forests, specifically, building a predictive classification and regression model using random forest ensemble. We want to use these examples of random forest in the classification and regression setting to guide someone new to random forests through its applications. We used the titanic dataset for our classification example and the auto dataset for our regression model example.

The auto dataset consists of 392 observations on the following nine features:

- Miles per gallon

- Number of cylinders

- Engine displacement

- Horsepower

- Vehicle weight

- Acceleration

- Year

- Origin

- Name

The titanic dataset consists of the following features for 891 passengers aboard the Titanic:

- Passenger id

- Survived (yes/no)

- Passenger class

- Name

- Sex

- Age

- Sib_sp (number of siblings and spouses aboard)

- Parch (number of parents and children aboard)

- Ticket number

- Ticket fare

- Cabin number

For the auto dataset, the correlation matrix shows that there are several negative and positive correlations between the variables, including a negative correlation between cylinders and mpg and a positive correlation between cylinders and displacement. The best performing random forest model had 8 randomly sampled predictors, 300 trees, and a minimum of 10 data points in a node. The variable importance plot shows that the top three most influential predictors were displacement, weight, and horsepower with an RMSE around 2.

For the titanic dataset, the correlation matrix of all continuous random variables shows that there are several negative and positive correlations between the variables, including a negative correlation between age and sib_sp and a positive correlation between sib_sp and parch. The best random forest model had 1 randomly samplied predictor, 600 trees, and a minimum of 12 data points in a node. The variable importance plot shows that the top three most influential predictors were sex_male, the interaction between sex_male and fare, and fare. The performance metrics were 0.901 for the ROC AUC, 0.689 for the sensitivity, 0.976 for the specificity, and 0.866 for the accuracy.

Repository contents: an explanation of the directory structure of the repository. The root directory is named Vignette-RandomForests, which consists of .gitignore, .RData, .Rhistory, README.md, Vignette-RandomForests.Rproj, as well as the folders data, scripts, and Vignette_files. The data folder consists of titanic_codebook.txt, titanic.csv, and tune_rf.rda. The scripts folder consists of AutoCorrplot.pdf, class_vignette_scratch.qmd, FinalProjectCarsRF.html, FinalProjectCarsRF.Rmd, method_scratch.qmd, titanic_code_example.R, titanic-work.R, vignette_scratch.html, vignette_scratch.qmd, as well as the folders images and vignette_scratch_files. The images folder consists of bkgrd-tree-ex.jpg, gini-index-formula.png, and toy-dataset2.png, while the vignette_scratch_files folder has a figure-html folder that consists of unnamed-chunk-3-1.png, unnamed-chunk-6-1.png, and unnamed-chunk-7-1.png. The Vignette_files folder consists of the folders figure-html and libs. The figure-html folder consists of unnamed-chunk-3-1.png, unnamed-chunk-6-1.png, and unnamed-chunk-7-1.png, while the libs folder consists of the folders bootstrap, clipboard, and quarto-html. The bootstrap folder consists of bootstrap-icons.css, bootstrap-icons.woff, bootstrap.min.css, and bootstrap.min.js. The clipboard folder consists of clipboard.min.js, and the quarto-html folder consists of anchor.min.js, popper.min.js, quarto-syntax-highlighting.css, quarto.js, tippy.css, and tippy.umd.min.js.

Reference list: 2 or more references to learn more about your topic.

A typical README file would also contain instructions on use and instructions on contributing to the repository.

