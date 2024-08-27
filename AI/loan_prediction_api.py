# loan_prediction_api.py

from flask import Flask, request, jsonify
import joblib
import pandas as pd

app = Flask(__name__)

# Load the trained model
model = joblib.load('loan_prediction_model.joblib')

@app.route('/predict_loan', methods=['POST'])
def predict_loan():
    data = request.get_json()
    loan_history = data.get('loan_history')
    credit_score = data.get('credit_score')
    income = data.get('income')

    # Prepare the input for prediction
    input_df = pd.DataFrame({
        'loan_history': [loan_history],
        'credit_score': [credit_score],
        'income': [income]
    })

    # Make the prediction
    predicted_loan = model.predict(input_df)[0]

    return jsonify({'predicted_loan_amount': predicted_loan})

if __name__ == '__main__':
    app.run(port=5000)
