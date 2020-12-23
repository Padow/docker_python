FROM nginx:stable-alpine

ENV PYTHONUNBUFFERED=1
RUN apk add --no-cache python3=3.8.2-r1 && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache-dir --upgrade pip==20.3.3 setuptools==51.1.0

RUN apk add --no-cache gcc=9.3.0-r0 python3-dev=3.8.2-r1 musl-dev=1.1.24-r3 libffi-dev=3.2.1-r6 openssl-dev=1.1.1i-r0 libxml2-dev=2.9.10-r4 libxslt-dev=1.1.34-r0
RUN pip install --no-cache-dir cython==0.29.21

WORKDIR /usr/src/app

COPY requirements.txt .

RUN pip3 install --no-cache-dir -r requirements.txt
