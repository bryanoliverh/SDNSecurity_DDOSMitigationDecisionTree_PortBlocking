#Accuracy Score
#http://rasbt.github.io/mlxtend/user_guide/plotting/plot_decision_regions/
from __future__ import division
import numpy
import os
from sklearn import svm
from collections import deque
import matplotlib.pyplot as plt
from mlxtend.plotting import plot_decision_regions
import numpy as np
from google.colab import drive
drive.mount('/content/drive')
data = np.loadtxt(open('/content/drive/MyDrive/Colab Notebooks/resultthreetier.csv', 'rb'), delimiter=',')

sfe = 0
ssip = 1
rfip = 2


X = data[:, [sfe,ssip]]
print('Standard Deviation for Speed of Flow Entry:', np.std(data[:, [sfe]]))
print('Standard Deviation for Speed of Source IP:', np.std(data[:, [ssip]]))
print('Standard Deviation of Ratio in Flow Entry Pair:', np.std(data[:, [rfip]]))
y = data[:, 3]
clf = svm.SVC()
clf.fit(X, y)

fig = plt.figure(figsize=(10,8))
fig = plot_decision_regions(X=X,
                      y=y.astype(int),
                      clf=clf,
                      legend=2, colors='cyan,red')

plt.xlabel('Speed of Flow Entry', fontweight='bold')
plt.ylabel('Speed of Source IP', fontweight='bold')
L=plt.legend()
L.get_texts()[0].set_text('Normal Traffic')
L.get_texts()[1].set_text('Attack Traffic')
ax = plt.axes()
ax = plt.axes()
ax.patch.set_alpha(0.3)
# ax.set_facecolor("cyan")
ax.set_facecolor("limegreen")
# L.facecolor ='snow'
# L.edgecolor ='snow'

# plt.rcParams.update({'axes.facecolor':'green'})

# ax.set_facecolor(color='green')
plt.savefig("mitigation_graph1.png")




#Graph1 sfe & rfip
X = data[:, [sfe,rfip]]
y = data[:, 3]
clf = svm.SVC()
clf.fit(X, y)
fig = plt.figure(figsize=(10,8))
fig = plot_decision_regions(X=X,
                      y=y.astype(int),
                      clf=clf,
                      legend=2, colors='cyan,red')
# plt.title('Demografi Akurasi dan Proses Mitigasi Serangan pada Arsitektur Three Tier', size=16, fontweight='bold')
plt.xlabel('Speed of Flow Entry', fontweight='bold')
plt.ylabel('Ratio in Flow Entry Pair', fontweight='bold')
plt.savefig("mitigation_graph2.png")
L=plt.legend()
L.get_texts()[0].set_text('Normal Traffic')
L.get_texts()[1].set_text('Attack Traffic')
ax = plt.axes()
ax.patch.set_alpha(0.3)
ax.set_facecolor("limegreen")
