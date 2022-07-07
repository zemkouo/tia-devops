FROM httpd
LABEL maintainer="Tia Leo"
USER root
RUN apt -y update && \
    apt -y install wget && \
    apt -y install unzip

WORKDIR /usr/local/apache2/htdocs/

RUN rm -rf * && \
    # Change directory to top level directory in the repo
    # TOP="$(git rev-parse --show-toplevel)" && \
    # cd "${TOP}" || exit 2 &&\
    cp -R code/* /usr/local/apache2/htdocs/ 

CMD ["httpd-foreground"]
EXPOSE 80
