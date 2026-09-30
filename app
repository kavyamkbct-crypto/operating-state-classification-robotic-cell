
#### **File 3: app.py**
```python
import streamlit as st
import pickle
import pandas as pd

st.title("Robotic Machine Cell - Operating State Classifier")
st.write("Problem 36 - Learn Depth Academy")

# Load model
# model = pickle.load(open('models/logistic_regression_pipeline.pkl','rb'))

speed = st.number_input("speed_rpm", 0, 5000, 1500)
load = st.number_input("load_pct", 0, 100, 50)
power = st.number_input("power_w", 0, 2000, 500)
temp = st.number_input("temperature_c", -10, 120, 40)
vib = st.number_input("vibration_mms", 0.0, 10.0, 2.0)
pressure = st.number_input("pressure_bar", 0.0, 10.0, 3.0)

if st.button("Predict State"):
    # Sample prediction logic - replace with model.predict
    input_df = pd.DataFrame([[speed, load, power, temp, vib, pressure]],
    columns=['speed_rpm','load_pct','power_w','temperature_c','vibration_mms','pressure_bar'])
    # pred = model.predict(input_df)
    # st.success(f"Predicted State: {pred}")
    st.success("Model loaded - Prediction will appear here")
