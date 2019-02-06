FROM pytorch/pytorch:0.4.1-cuda9-cudnn7-runtime
LABEL maintainer="private@apushin.com"

RUN apt-get update && apt-get install -y software-properties-common
RUN add-apt-repository ppa:mc3man/xerus-media && \
    apt-get update && apt-get install -y ffmpeg frei0r-plugins

COPY requirements.txt requirements.txt
RUN pip install --upgrade pip &&  pip install -r requirements.txt

WORKDIR /workdir

EXPOSE 8101

WORKDIR /workdir
ENTRYPOINT ./video_to_slomo.py --checkpoint data/checkpoints/SuperSloMo.ckpt

