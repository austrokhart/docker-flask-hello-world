
FROM python:3


LABEL maintainer="dmvw34 <dmvw34@gmail.com>"


EXPOSE 9000
WORKDIR /usr/src/app


# install the requirements first to cache it

COPY app/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt


COPY app .


# uwsgi --socket 127.0.0.1:3031 --wsgi-file myflaskapp.py --callable app --processes 4 --threads 2 --stats 127.0.0.1:9191
# uwsgi -s /tmp/uwsgi.sock --chmod-socket=666 --manage-script-name --mount /=app:app

ENTRYPOINT ["uwsgi"]
CMD ["./socket-uwsgi.ini"]
