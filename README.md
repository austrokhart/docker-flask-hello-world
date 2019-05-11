
# docker-flask-hello-world

This project is a simple example of containerization of the Flask application, hosted with uWSGI and Nginx.


## Development

For development, change the working directory to `app`.

To create an environment execute: <br>
`python3 -m venv venv`

To activate the environment execute: <br>
`. venv/bin/activate`

To install dependencies execute: <br>
`pip install -r requirements.txt`


## Deployment

The project contains two dockerfiles, `uwsgi.dockerfile` and `nginx.dockerfile`.

The `uwsgi.dockerfile` file declares the uWSGI service that hosts the Flask application, available through the socket with using the `uwsgi` protocol at `{host}`:`{port}`.

The `nginx.dockerfile` file declares the Nginx service that reverse proxies the uWSGI service with using the `uwsgi` protocol at `{uwsgi_host}`:`{uwsgi_port}` on `0.0.0.0`:`{nginx_port}`.

The `docker-compose.yml` file builds and runs images one after another and maps the `nginx` container port `{nginx_port}` to the host port `{host_port}`.

To run a stack of containers execute:<br>
`docker-compose up`

After that the application will be available at `localhost`:`{nginx_port}` or `{server_ip}`:`{nginx_port}`.

To override the `docker-compose.yml` file settings create a `docker-compose.override.yml` file with the same structure and custom settings.