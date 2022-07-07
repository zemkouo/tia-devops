FROM httpd
LABEL maintainer="Tia Leo"
RUN apt -y update && \
    apt -y install wget && \
    apt -y install unzip

WORKDIR /usr/local/apache2/htdocs/

RUN rm -rf * && \
    # Change directory to top level directory in the repo
    TOP="$(git rev-parse --show-toplevel)" && \
    cd "${TOP}" || exit 2 &&\
    cd pipeline/applications && \
    cp -R covid19/* /usr/local/apache2/htdocs/ 

USER root
CMD ["httpd-foreground"]
EXPOSE 80
