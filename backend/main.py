import time

from fastapi import FastAPI
from datetime import datetime
from apscheduler.schedulers.background import BackgroundScheduler
import uvicorn

app = FastAPI()

scheduler = BackgroundScheduler()


def wan_android_schedule():
    print('Tick! The time is: %s' % datetime.now())


@app.on_event("startup")
async def startup_event():
    scheduler.add_job(wan_android_schedule, 'interval', minutes=1)
    scheduler.start()
    time.sleep(5)
    wan_android_schedule()


@app.on_event("shutdown")
async def shutdown_event():
    scheduler.shutdown()
    print("server is shutdown.")


@app.get("/")
async def root():
    return {"message": "Hello World"}


if __name__ == "__main__":

    uvicorn.run(app, host="127.0.0.1", port=8000)