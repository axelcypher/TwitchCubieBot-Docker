FROM 3.9.16-slim-bullseye

RUN apt install git

RUN mkdir /app && \
    chmod 777 -R /app && \
    cd /app
    
WORKDIR /app    
    
RUN git clone https://github.com/axelcypher/TwitchCubieBot-Docker.git && \
    copy ./TwitchCubieBot-Docker/* ./ && \
    rm -R ./TwitchCubieBot-Docker
    


RUN pip install -r requirements.txt

ENTRYPOINT ./run.sh 
