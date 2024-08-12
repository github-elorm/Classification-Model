# Importing the Cancer dataset
str(Cancer_Data)
df<-(read.csv("C:/Users/elorm/Downloads/Cancer_Data.csv"))

# converting the attributes to factors because the target variable should
# be categorical for classification
df$Smoking<-as.factor(df$Smoking)
df$GeneticRisk<-as.factor(df$GeneticRisk)
df$CancerHistory<-as.factor(df$CancerHistory)
df$Diagnosis<-as.factor(df$Diagnosis)
df$Gender<-as.factor(df$Gender)


# checking the structure of the dataset to ensure the attributes 
#have been changed.
str(df)

set.seed(230)
dt_df<-df
dt_train_index<-sample(1:nrow(dt_df), 0.7 * nrow(dt_df))
dt_train_data<-df[dt_train_index,]
dt_test_data<-df[-dt_train_index,]

model_dt<-rpart(Diagnosis~.,
                data = dt_train_data, method = "class")

rpart.plot(model_dt)

dt_predicted<-predict(model_dt,dt_test_data,
                      type = "class")

dt_cmatrix<-confusionMatrix(dt_predicted,dt_test_data$Diagnosis)

accuracy_dt<-dt_cmatrix$overall['Accuracy']
dt_sensitivity<-dt_cmatrix$byClass['Sensitivity']
dt_specificity<-dt_cmatrix$byClass['Specificity']
dt_precision<-dt_cmatrix$byClass['Pos Pred Value']
dt_recall<-dt_sensitivity

dt_f1<-2 * (dt_precision * dt_recall) / (dt_precision + dt_recall)



### Naive Bayes

model_nb<-naiveBayes(formula  = Diagnosis~., data = dt_train_data)

nb_predicted<-predict(model_nb,dt_test_data)

cmatrix_nb<-confusionMatrix(nb_predicted,dt_test_data$Diagnosis)

accuracy_nb<-cmatrix_nb$overall['Accuracy']
nb_sensitivity<-cmatrix_nb$byClass['Sensitivity']
nb_specificity<-cmatrix_nb$byClass['Specificity']
nb_precision<-cmatrix_nb$byClass['Pos Pred Value']
nb_recall<-nb_sensitivity

nb_f1<-2 * (nb_precision * nb_recall) / (nb_precision + nb_recall)




### random forest

rf_model<-randomForest(Diagnosis~.,
                       data = dt_train_data,
                       mtry = 3,
                       ntree = 100 )

rf_predictions<-predict(rf_model,dt_test_data)
rf_cmatrix<-confusionMatrix(rf_predictions,dt_test_data$Diagnosis)

accuracy_rf<-rf_cmatrix$overall['Accuracy']
rf_sensitivity<-rf_cmatrix$byClass['Sensitivity']
rf_specificity<-rf_cmatrix$byClass['Specificity']
rf_precision<-rf_cmatrix$byClass['Pos Pred Value']
rf_recall<-rf_sensitivity

rf_f1<-2 * (rf_precision * rf_recall) / (rf_precision + rf_recall)



### k nearest neighbour

knn_model<-knn(dt_train_data, dt_test_data,
               cl = dt_train_data$Diagnosis,k = 5)

knn_cmatrix<-confusionMatrix(knn_model,dt_test_data$Diagnosis)

accuracy_knn<-knn_cmatrix$overall['Accuracy']
knn_sensitivity<-knn_cmatrix$byClass['Sensitivity']
knn_specificity<-knn_cmatrix$byClass['Specificity']
knn_precision<-knn_cmatrix$byClass['Pos Pred Value']
knn_recall<-knn_sensitivity
knn_f1<-2 * (knn_precision * knn_recall) / (knn_precision + knn_recall)
