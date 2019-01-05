#Diabetes Data set
from sklearn import datasets
diabetes = datasets.load_diabetes()
import matplotlib.pyplot as plt 

import numpy as np
import pandas as pd


table = pd.DataFrame(data=diabetes['data'],columns= diabetes['feature_names'])
other = pd.DataFrame(data=diabetes['target'],columns=['age'])
from sklearn.model_selection import train_test_split
# create training and testing vars
X_train, X_test, y_train, y_test = train_test_split(diabetes['data'],diabetes['target'], test_size=0.3)
print(X_train.shape, y_train.shape)
print(X_test.shape, y_test.shape)

from sklearn.linear_model import LinearRegression

lm = LinearRegression()
modelo = lm.fit(X_train, y_train)

y_pred = modelo.predict(X_test)

plt.scatter(y_test, y_pred)
plt.xlabel("Disease")
plt.ylabel("Predicted Disease")
plt.title("Disease vs Predicted Disease")
