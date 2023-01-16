FROM python:3.9.16-slim-bullseye


RUN apt update -y
RUN apt upgrade -y
RUN apt install git -y

RUN mkdir /app && \
    chmod 777 -R /app && \
    cd /app
    
WORKDIR /app    
    
RUN git clone https://github.com/axelcypher/TwitchCubieBot-Docker.git && \
    mv ./TwitchCubieBot-Docker/* ./ && \
    rm -R ./TwitchCubieBot-Docker
    


RUN pip install -r requirements.txt

ENTRYPOINT ./run.sh 
