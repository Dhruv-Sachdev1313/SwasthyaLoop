import os
import firebase_admin

from firebase_admin import credentials, firestore
from dotenv import load_dotenv

load_dotenv()

def connect(name):
    """
    name : str
        name of the collection in firestore
    """
    cred = credentials.Certificate(os.getenv('firebase_key'))

    firebase_admin.initialize_app(cred, 
    {
    'databaseURL': os.getenv('firebase_route')
    })

    db = firestore.client()
    collection = db.collection(u'{}'.format(name))

    print("Firebase Connected")
    return collection
