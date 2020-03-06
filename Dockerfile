#   FROM python:3.7-alpine
# VOLUME [".", "/app"]
# WORKDIR /app
# RUN systemctl disable apparmore.service --now
# RUN pip install -r requirements.txt
# ENTRYPOINT ["python"]
# CMD ["app.py"]


# FROM python:2.7
# VOLUME $(pwd) /app
# WORKDIR /app
# RUN pip install -r requirements.txt
# WORKDIR /app/app
# ENTRYPOINT ["python"]
# CMD ["app.py"]


FROM tiangolo/uwsgi-nginx:python3.7
COPY ./app /app
RUN pip install flask flask_restful