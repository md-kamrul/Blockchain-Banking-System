# chatbot_api.py

from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route('/chatbot', methods=['POST'])
def chatbot():
    data = request.get_json()
    user_message = data.get('message', '').lower()

    if 'loan' in user_message:
        response = "I can help you with loan-related queries. How can I assist you?"
    elif 'transaction' in user_message:
        response = "You can view transactions in the Transactions section of your dashboard."
    else:
        response = "I'm here to help you with banking-related information. How can I assist you today?"

    return jsonify({'reply': response})

if __name__ == '__main__':
    app.run(port=5001)
