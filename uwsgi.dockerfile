
FROM python:3.7-stretch


LABEL maintainer="dmvw34 <dmvw34@gmail.com>"


ARG HOST
ARG PORT

ENV HOST=${HOST}
ENV PORT=${PORT}


EXPOSE 9000


WORKDIR /usr/src/app


# install envsubst

RUN apt update && apt install -y gettext-base


# copy requirements and install it first for caching

COPY app/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt


# copy a uwsgi config and replace values by the env variables

COPY app/socket-uwsgi.ini.template .
RUN envsubst < socket-uwsgi.ini.template > socket-uwsgi.ini


# copy app files

COPY app .


ENTRYPOINT ["uwsgi"]
CMD ["./socket-uwsgi.ini"]
