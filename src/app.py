from fastapi import FastAPI
from pydantic import BaseModel
import joblib
import pandas as pd

app = FastAPI()

# Load the trained model
model = joblib.load("models/model.pkl")

class InputData(BaseModel):
    age: int
    sex: str
    bmi: float
    children: int
    smoker: str
    region: str

@app.get("/")
def health_check():
    return {"status": "ok"}

@app.post("/predict")
def predict(item: InputData):
    df = pd.DataFrame([item.dict()])
    prediction = model.predict(df)
    return {"prediction": int(prediction[0])}