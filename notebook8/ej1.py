import sklearn
import numpy as np
import pandas as pd
from sklearn import datasets
wines = datasets.load_wine()

len(wines.data)

data = pd.DataFrame(data=wines['data'],columns= wines['feature_names'])
categories = pd.DataFrame(data=wines['target'],columns=['target'])
#Mostrar los 5 primeros datos del dataset
data[:5]

from sklearn.model_selection import train_test_split
# create training and testing vars
X_train, X_test, y_train, y_test = train_test_split(wines['data'],wines['target'], test_size=0.3)

from sklearn.neighbors import KNeighborsClassifier 

#Inicializamos el algoritmo k_Vecinos_más_cercano con un parametro de 4 vecinos.
algo_knn = KNeighborsClassifier(n_neighbors=3) 

modelo_predictivo = algo_knn.fit(X_train, y_train)
predicciones = modelo_predictivo.predict(X_test)

from sklearn.metrics import classification_report, confusion_matrix

error = []

# Calculating error for K values between 1 and 40
for i in range(1, 40):  
    knn = KNeighborsClassifier(n_neighbors=i)
    knn.fit(X_train, y_train)
    pred_i = knn.predict(X_test)
    error.append(np.mean(pred_i != y_test))
    
import matplotlib.pyplot as plt  

plt.figure(figsize=(12, 6))  
plt.plot(range(1, 40), error, color='red', linestyle='dashed', marker='o',  
         markerfacecolor='blue', markersize=10)
plt.title('Error Rate K Value')  
plt.xlabel('K Value')  
plt.ylabel('Mean Error') 

knn = KNeighborsClassifier(n_neighbors=7)
knn.fit(X_train, y_train)
pred_i = knn.predict(X_test)

print(confusion_matrix(y_test, pred_i))  
print(classification_report(y_test, pred_i))   
