
FROM nginx


LABEL maintainer="dmvw34 <dmvw34@gmail.com>"


ARG NGINX_PORT
ARG UWSGI_HOST
ARG UWSGI_PORT

ENV NGINX_PORT=${NGINX_PORT}
ENV UWSGI_HOST=${UWSGI_HOST}
ENV UWSGI_PORT=${UWSGI_PORT}


EXPOSE 80


WORKDIR /etc/nginx/conf.d/


COPY nginx/default.conf.template .
RUN envsubst < default.conf.template > default.conf


ENTRYPOINT ["nginx"]
CMD ["-g", "daemon off;"]