# Iniciando uma imagem/selecionando
FROM ubuntu

# Variáveis
ENV timezone=America/Sao_Paulo

# Execução de comandos
RUN apt update && \
    ln -snf /usr/share/zoneinfo/${timezone} /etc/localtime && echo ${timezone} > /etc/timezone && \
    apt install -y apache2 && \
    apt install -y php && \
    apt install -y php-xdebug && \
    apt install -y php-7.3-mysql && \
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && php composer-setup.php && php -r "unlink('composer-setup.php');" && mv composer.phar /usr/local/bin/composer && chmod a+x /usr/local/bin/composer

EXPOSE 80

WORKDIR /var/www/html

ENTRYPOINT /etc/init.d/apache2 start && /bin/bash

CMD [ "true" ]