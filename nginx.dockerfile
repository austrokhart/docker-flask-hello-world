
FROM nginx


LABEL maintainer="dmvw34 <dmvw34@gmail.com>"


EXPOSE 80


COPY nginx/default.conf /etc/nginx/conf.d/


ENTRYPOINT ["nginx"]
CMD ["-g", "daemon off;"]