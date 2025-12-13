import streamlit as st
import pickle
import numpy as np
import pandas as pd
import os

# -------------------------
# Load model + scaler + features
# -------------------------
with open("insurance_model.pkl", "rb") as f:
    model_dict = pickle.load(f)

model = model_dict["model"]          # Ridge model
scaler = model_dict["scaler"]        # StandardScaler
feature_names = model_dict["feature_names"]  # List of features

st.title("Welcome! This is an Insurance Cost Prediction!")

age = st.number_input("Age", min_value=18, max_value=100)
bmi = st.number_input("BMI", min_value=10.0, max_value=60.0)
children = st.number_input("Children", min_value=0, max_value=5, step=1)
sex = st.selectbox("Sex", ["male", "female"])
smoker = st.selectbox("Smoker", ["yes", "no"])
region = st.selectbox("Region", ["northeast", "northwest", "southeast", "southwest"])

# -------------------------
# Preprocess user inputs
# -------------------------

# 1. Create dataframe with ALL features expected by the model
data = pd.DataFrame([[age, bmi, children, sex, smoker, region]],
                    columns=["age", "bmi", "children", "sex", "smoker", "region"])

# One-hot encoding just like training
data = pd.get_dummies(data)

# 2. Add missing dummy columns
for col in feature_names:
    if col not in data.columns:
        data[col] = 0

data = data[feature_names]

# 3. Scale
scaled = scaler.transform(data)

# -------------------------
# Predict
# -------------------------
if st.button("Predict"):
    pred = model.predict(scaled)[0]
    st.success(f"Estimated Insurance Cost: ${pred:,.2f}")