FROM tiangolo/uvicorn-gunicorn-fastapi:python3.9

ARG APP_SET=dev
COPY ./requirements.txt /app/requirements.txt
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r /app/requirements.txt

COPY ./src /app/src

COPY ./${APP_SET}-appsettings.yaml /app/appsettings.yaml

ENV PYTHONPATH=/app

EXPOSE 8000

WORKDIR /app

# sleep to wait until the database is ready
CMD sleep 5 && python src/main.py
#CMD ["sh", "-c", "sleep 5 && python src/main.py"]
