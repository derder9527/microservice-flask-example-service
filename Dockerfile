FROM python:3.7-slim AS builder

COPY ./requirements.txt .
RUN pip install -r requirements.txt

FROM python:3.7.11-alpine3.13
COPY --from=builder /usr/local/lib/python3.7/site-packages /usr/local/lib/python3.7/site-packages
WORKDIR /app
ENV FLASK_ENV=development \
    FLASK_RUN_PORT=5487  \
    FLASK_RUN_HOST="0.0.0.0"

COPY . .
EXPOSE 5487
CMD [ "python", "./app.py" ]