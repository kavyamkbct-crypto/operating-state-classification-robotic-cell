# Operating-State Classification of an Automated Robotic Machine Cell
**Learn Depth Academy LLP - Track 1 Final Capstone - Problem 36**

> Identifying Idle, Light Load, Normal Operation and Heavy Load states from speed, load, power, temperature, vibration and pressure sensors

**Author:** Kavya M K - Machine Learning Intern (September 2026)

### Abstract
Automated robotic machines report their condition through sensors. This project classifies the operating state of a simulated robotic machine cell into 4 classes using 6 sensor readings. A 6,040-row simulated dataset was cleaned and used to compare Logistic Regression, KNN and Decision Tree.

**Best Model: Logistic Regression**
- Accuracy: 93.9%
- Macro F1: 94.2%
- Macro ROC-AUC: 0.993
- All errors are between neighbouring states only

### Dataset
- **Rows:** 6040 raw / 6000 after cleaning
- **Features:** speed_rpm, load_pct, power_w, temperature_c, vibration_mms, pressure_bar
- **Target:** state {0:Idle, 1:Light Load, 2:Normal Operation, 3:Heavy Load}
- **Issues simulated:** 60 missing power, 121 temp, 90 vibration, 90 pressure, 40 duplicates, 8 impossible temp >120°C
- **Generation:** `src/generate_data.py` with seed 42

### Methodology
1. Cleaning: Remove 40 duplicates before split, temp >120°C -> set as missing
2. Split: Stratified 80/20 train/test (random_state=42)
3. Preprocessing: Median imputation + Standard Scaling inside Pipeline (no leakage)
4. Models: Logistic Regression, KNN (k=7), Decision Tree (depth 5)
5. Selection: 5-fold CV ranked by macro-F1

### Results

| Model | Accuracy | Macro F1 | ROC-AUC |
|---|---|---|---|
| Logistic Regression | 0.9392 | 0.9415 | 0.9928 |
| KNN (k=7) | 0.9325 | 0.9349 | 0.9815 |
| Decision Tree | 0.9283 | 0.9310 | 0.9828 |

**Key Finding:** Speed (0.446), Load (0.263), Power (0.134) are most informative. Temperature, vibration, pressure are correlated and add little in this simulation.

### Prototype App
Streamlit app `app.py` loads saved pipeline, validates inputs, returns predicted state with probabilities.

```bash
pip install -r requirements.txt
streamlit run app.py
