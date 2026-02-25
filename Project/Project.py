
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

from sklearn.model_selection import train_test_split
from sklearn.neural_network import MLPClassifier
from sklearn.metrics import accuracy_score

# -------------------- Load data --------------------

data = pd.read_csv("diabetes.csv")

X = data[['Glucose', 'BloodPressure', 'BMI', 'Age']].values
Y = data['Outcome'].values

# -------------------- Normalization ---------------------

X_min = X.min(axis=0)
X_max = X.max(axis=0)

X = (X - X_min) / (X_max - X_min)

# -------------------- Train / Test split --------------------

X_train, X_test, Y_train, Y_test = train_test_split(X, Y, test_size = 0.2, random_state = 123)

# -------------------- MLP Model --------------------

model = MLPClassifier(hidden_layer_sizes = (8, 4), activation = 'relu', solver = 'adam', max_iter = 2000, random_state = 123)

model.fit(X_train, Y_train)

# -------------------- Accuracy --------------------

y_train_pred = model.predict(X_train)
y_test_pred = model.predict(X_test)

train_acc = accuracy_score(Y_train, y_train_pred)
test_acc = accuracy_score(Y_test, y_test_pred)

# -------------------- Loss Curve (Training process) --------------------

plt.figure()
plt.plot(model.loss_curve_)

plt.xlabel("Iteration")
plt.ylabel("Loss")

plt.title("MLP Training Loss Curve")
plt.grid(True)
plt.show()

# -------------------- Extract weights & biases --------------------

W1, W2, W3 = model.coefs_
b1, b2, b3 = model.intercepts_

# -------------------- Fixed-point conversion --------------------

SCALE = 256 

def fixed_point(x): return np.round(x * SCALE).astype(int)

W1_fx = fixed_point(W1)
b1_fx = fixed_point(b1)

W2_fx = fixed_point(W2)
b2_fx = fixed_point(b2)

W3_fx = fixed_point(W3)
b3_fx = fixed_point(b3)

# -------------------- Save to text files --------------------

np.savetxt("W1_fx.txt", W1_fx, fmt="%d")
np.savetxt("b1_fx.txt", b1_fx, fmt="%d")

np.savetxt("W2_fx.txt", W2_fx, fmt="%d")
np.savetxt("b2_fx.txt", b2_fx, fmt="%d")

np.savetxt("W3_fx.txt", W3_fx, fmt="%d")
np.savetxt("b3_fx.txt", b3_fx, fmt="%d")