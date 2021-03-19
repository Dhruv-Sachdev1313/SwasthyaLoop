import os

from dotenv import load_dotenv
from flask import (
    Flask,
    jsonify
)

load_dotenv()
app = Flask(__name__)

@app.route('/test')
def home():
    return jsonify(msg='flask connected')

if __name__ == "__main__":
    app.run(debug=True)
