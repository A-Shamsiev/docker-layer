FROM ubuntu:20.04

# We copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN apt-get update -y && apt-get install -y python3-pip && pip3 install -r requirements.txt

COPY . /app

ENTRYPOINT [ "python3" ]

CMD [ "-m" , "flask", "run", "--host=0.0.0.0"]
