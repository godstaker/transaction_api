from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route('/')
def home():
    return "Welcome to the Transaction API!"

@app.route('/api/transaction', methods=['POST'])
def create_transaction():
    data = request.get_json()
    transaction_id = data.get('transactionId')
    amount = data.get('amount')
    timestamp = data.get('timestamp')

    if not transaction_id or not amount or not timestamp:
        return jsonify({"error": "Missing required fields"}), 400

    # In a real-world scenario, here you would save the data to a database
    return jsonify({
        "transaction_id": transaction_id,
        "amount": amount,
        "timestamp": timestamp
    }), 201

if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=5000)