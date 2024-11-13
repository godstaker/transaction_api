from flask import Flask, request, jsonify, render_template
from flask_sqlalchemy import SQLAlchemy
import uuid
from datetime import datetime

# Initialize the Flask application
app = Flask(__name__)

# Configure the SQLite database connection
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///db.sqlite'  # Database file path
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False  # Disable track modifications to save resources
db = SQLAlchemy(app)  # Initialize SQLAlchemy with the Flask app

# Define the Transaction model to represent each transaction record in the database
class Transaction(db.Model):
    id = db.Column(db.Integer, primary_key=True)  # Unique ID for each record (auto-increment)
    transaction_id = db.Column(db.String(36), unique=True, nullable=False)  # Unique transaction ID (UUID)
    amount = db.Column(db.Float, nullable=False)  # Transaction amount
    timestamp = db.Column(db.DateTime, nullable=False)  # Timestamp of the transaction

    # Constructor to initialize a new Transaction
    def __init__(self, transaction_id, amount, timestamp):
        self.transaction_id = transaction_id
        self.amount = amount
        self.timestamp = timestamp

# Ensure tables are created before handling the first request
@app.before_first_request
def create_tables():
    db.create_all()  # Creates tables based on models if they don't already exist

# API endpoint to create a new transaction (POST request)
@app.route('/api/transaction/', methods=['POST'])
def create_transaction():
    # Parse JSON data from the incoming request
    data = request.get_json()
    transaction_id = data.get('transactionId')  # Extract transaction ID
    amount = data.get('amount')  # Extract amount
    timestamp = data.get('timestamp')  # Extract timestamp
    
    try:
        # Validate transaction data
        transaction_uuid = uuid.UUID(transaction_id)  # Validate transaction ID as a UUID
        amount = float(amount)  # Convert amount to a float
        timestamp = datetime.fromisoformat(timestamp.replace("Z", "+00:00"))  # Convert timestamp to datetime object

        # Create a new Transaction record and add it to the database
        new_transaction = Transaction(transaction_id=str(transaction_uuid), amount=amount, timestamp=timestamp)
        db.session.add(new_transaction)  # Add to the current database session
        db.session.commit()  # Commit the session to save changes to the database

        # Return a success response
        return jsonify({'message': 'Transaction stored successfully!'}), 201

    except Exception as e:
        # If there's an error (e.g., invalid data), return an error response
        return jsonify({'error': str(e)}), 400

# API endpoint to retrieve all transactions in JSON format (GET request)
@app.route('/api/transactions', methods=['GET'])
def get_transactions():
    # Query all transactions from the database
    transactions = Transaction.query.all()

    # Format each transaction as a dictionary and return as JSON
    return jsonify([
        {
            "transaction_id": tx.transaction_id,
            "amount": tx.amount,
            "timestamp": tx.timestamp.isoformat()  # Convert timestamp to ISO format string
        } for tx in transactions
    ])

# Web page to display all transactions in a table format
@app.route('/transactions')
def transactions_page():
    # Render the HTML template 'transactions.html' to display transactions
    return render_template('transactions.html')

# Start the Flask application (only if run directly)
if __name__ == '__main__':
    # Bind to all network interfaces (0.0.0.0) so it can be accessed from outside the container
    app.run(host='0.0.0.0', port=5000)