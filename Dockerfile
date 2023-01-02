FROM ubuntu:22.04.1

WORKDIR /bot
RUN chmod 777 /bot


RUN apt -qq update
RUN apt -qq install -y python3 python3-pip locales megatools
COPY requirements.txt .
RUN apt -qq update --fix-missing && \
    apt -qq install -y git \
    wget \
    curl \
    python3 \
    ffmpeg \
    python3-pip \
    p7zip-full \
    p7zip-rar

RUN pip3 install --no-cache-dir -r requirements.txt
COPY . .
# RUN chmod +x aria.sh

CMD ["python3","-m","bot"]
