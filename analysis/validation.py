#Accuracy reference: https://github.com/kshitijved/Support_Vector_Machine

from sklearn import svm, datasets
import matplotlib.pyplot as plt
import numpy as np
from sklearn.metrics import accuracy_score
from sklearn.model_selection import train_test_split


data = np.loadtxt(open('result.csv', 'rb'), delimiter=',')

X = data[:, 0:3]
y = data[:, 3]
x_train, x_test, y_train, y_test = train_test_split(X, y, random_state = 0, test_size = 0.25)#clf = svm.SVC()

clf = svm.SVC()
#clf = tree.DecisionTreeClassifier()
clf.fit(x_train, y_train)
classifier_predictions = clf.predict(x_test)
print("Detection Rate Process")
length = len(y_test)
DD = 0
DN = 0
FD = 0
TN = 0
for i in range(0,length):
    #print("Actual",y_test[i], "prediction", classifier_predictions[i])
    if y_test[i] == 1.0:
        if classifier_predictions[i] == 1.0:
            DD = DD + 1
        else:
            DN = DN + 1
    if y_test[i] == 0.0:
        if classifier_predictions[i] == 1.0:
            FD = FD + 1
        else:
            TN = TN + 1
DR = DD / (DD + DN)
print("Average Detection Rate :", DR)
FAR = FD / (FD + TN)
print("Average False Posivie", FAR)
