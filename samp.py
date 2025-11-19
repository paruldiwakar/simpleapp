import pickle

with open("insurance_model.pkl", "rb") as f:
    obj = pickle.load(f)

print(type(obj))
print(obj)
