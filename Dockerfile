FROM python:latest

WORKDIR /home

RUN pip3 install dicttoxml==1.7.4 pymongo==3.12.1
