FROM python:latest
ENV VIRTUAL_ENV "/venv"
RUN python -m venv $VIRTUAL_ENV
ENV PATH "$VIRTUAL_ENV/bin:$PATH"
RUN mkdir krakinz
RUN apt update 
RUN apt upgrade -y 
RUN apt install git -y 
RUN apt install python3 -y && apt install python3-pip -y
RUN apt install -y ffmpeg opus-tools bpm-tools 
RUN cd krakinz
RUN git clone https://github.com/Krakinz/genStr.git
RUN cd genStr
WORKDIR /genStr
RUN pip install -r requirements.txt
CMD python3 genStr.py
