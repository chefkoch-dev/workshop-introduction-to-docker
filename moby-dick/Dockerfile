#docker build -t workshop/moby-dick .
FROM ubuntu:14.04

# upgrade system
RUN apt-get update && apt-get upgrade -yq

RUN apt-get install -yq \
    curl \
    php5-cli \
    php5-fpm \
    php5-intl \
    php5-mysql \
    php5-sqlite \
    php5-curl \
    nginx \
    supervisor \
    --no-install-recommends

# --- PHP STUFF ---
RUN sed -i "s@doc_root =@doc_root =/code@" /etc/php5/fpm/php.ini

RUN sed -i "s@;error_log = php_errors.log@error_log = /tmp/php_error.log@" /etc/php5/fpm/php.ini

# requirements for symfony app
RUN echo "date.timezone = Europe/Paris" >> /etc/php5/cli/php.ini
RUN echo "date.timezone = Europe/Paris" >> /etc/php5/fpm/php.ini

# --- NGINX STUFF ---
# Append "daemon off;" to the beginning of the configuration
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# Copy helloworld script to webroot
ADD etc/nginx/sites-available/default /etc/nginx/sites-available/default

# --- SUPERVISOR STUFF ---
# add supervisor configs
ADD etc/supervisor/conf.d/*.conf /etc/supervisor/conf.d/

WORKDIR /code

EXPOSE 80
EXPOSE 443

CMD /usr/bin/supervisord
