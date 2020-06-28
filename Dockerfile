FROM rocker/rstudio:3.6.3

LABEL maintainer="shawn.lin@gatech.edu"

WORKDIR /pyformr
RUN install2.r reticulate usethis
EXPOSE 8787

RUN apt-get update \
  && apt-get -y install python3-pip \
  && pip3 install pyform