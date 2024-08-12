# Classification-Model
Diagnosis of cancer using classification algorithms: Decision Tree, Naive Bayes, K-Nearest Neighbour and Random Forest

# Overview
This project contains four classification algorithms, namely;Decision Tree, Naive Bayes, K-Nearest Neighbour and Random Forest. The aim of this project is to predict a patient's cancer diagnosis using the Cancer dataset with the four algorithms. The data was sampled using a seed of 230 and split into a 70-30 ratio. The training set contains 70% of the data, while the test set contains the remaining 30% of the data. Evaluation metrics are created for each algorithm.The best algorithm is selected based on the evaluation metrics. This algorithm is then used to explain how a person is at risk of becoming cancerous or otherwise.
# Functionality
The set.seed function is used to set the random number generator seed. It ensures reproducibility of the results anytime the code is run.
The data set is then split into two sets; training set and test set.The training set contains 70% of the data and the test set contains the remaining 30% of the data. 
A decision tree model is built using the training set with Diagnosis as the target variable and all other attributes as explanatory variables. The model is then plotted. The model is then used to predict the class labels of the test set. A confusion matrix is created to evaluate the number of correct predictions the model made and to also obtain the evaluation metrics.

A Naive Bayes model is also built with the training data set where the Diagnosis attribute is the target variable and all other attributes are explanatory variables. The model then predicts the class lebels of the the test set. A confusion matrix to obtain the evaluation metrics of the model is created.

A Random forest model is also built with the training set. The target variable is Diagnosis and all other variables are explanatory variables. The mtry function sets the number of predictors to randomly sample at each split in the tree. For this code, 3 predictors will be randomly selected. The ntree function sets the number of trees to grow in the random forest. 100 trees trees will be grown for this model. The model is then used to predict the class labels of the test set.A confusion matrix is generated to obtain the evaluation metrics of the model as well as check the number of predictions of the model were correct.

K-Nearest Neighbour ia a lazy learner and does not keep the model after prediction. It predicts the class label of an instance based on its nearest neighbours.It is trained with the training set and it predicts the  class labels of the test set based on its 5 nearest neighbours. The confusion matrix is generated to evaluate the performance of the model.

Based on the evaluation metrics of all four models, the random forest is selected as the best algorithm because it has the highest accuracy, specificity and sensitivity. According to the algorithm, a person is at risk of developing cancer if they have a history of cancer, a genetic predisposition to cancer, have high alcohol intake, have a BMI greater than 24 and engage in poor physiacl activity. 


# Requirements
Ensure you have R installed
