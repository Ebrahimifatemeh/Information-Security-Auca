# Lab 13 – Task: Eventually sending log.txt to an API (Safe Demo)

## Note (Ethics)
I did not implement keystroke theft / spyware behavior. Instead, I demonstrate
the same concept safely: uploading a non-sensitive application log file to an API.

## Goal
- `log.txt` exists locally
- A sender function uploads new log data to an API server
- If the network is down, it retries later (“eventually saved on storage”)

## Example client (Python) – send only NEW log lines

```python
import os
import time
import requests

API_URL = "http://127.0.0.1:9000/upload-log"
LOG_PATH = "log.txt"
STATE_PATH = ".offset"  # last uploaded byte position

def read_offset() -> int:
    try:
        with open(STATE_PATH, "r", encoding="utf-8") as f:
            return int(f.read().strip() or "0")
    except FileNotFoundError:
        return 0

def write_offset(n: int) -> None:
    with open(STATE_PATH, "w", encoding="utf-8") as f:
        f.write(str(n))

def upload_new_log_data():
    if not os.path.exists(LOG_PATH):
        return

    offset = read_offset()
    size = os.path.getsize(LOG_PATH)

    # handle truncation/rotation
    if offset > size:
        offset = 0

    with open(LOG_PATH, "rb") as f:
        f.seek(offset)
        chunk = f.read()

    if not chunk:
        return

    r = requests.post(API_URL, json={
        "filename": "log.txt",
        "data": chunk.decode("utf-8", errors="replace")
    }, timeout=10)

    r.raise_for_status()
    write_offset(size)

def sender_loop(interval_seconds: int = 10):
    while True:
        try:
            upload_new_log_data()
        except Exception:
            # network/server down -> try again later
            pass
        time.sleep(interval_seconds)

# Example usage:
# 1) your app writes non-sensitive lines to log.txt
# 2) run sender_loop() to upload periodically





Test (concept)

Add a line to log.txt

Run the sender loop

Verify API receives data and stores it

Conclusion

This demonstrates “eventual” log delivery to a server: periodic upload, retry on failure,
and offset tracking so only new log content is sent.

-------------------------------------



