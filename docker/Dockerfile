FROM pytorch/pytorch:1.6.0-cuda10.1-cudnn7-runtime
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y git
RUN pip install jupyter jupyterlab tabulate

ADD docker/entrypoint.sh /tmp
ENTRYPOINT ["bash", "/tmp/entrypoint.sh"]
