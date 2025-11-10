# Use Ubuntu 22.04 as the base image
FROM ubuntu:22.04

# Update package list
RUN apt-get update && apt-get install -y 

# Install python
RUN apt-get install python3 -y
RUN apt-get install pip -y

COPY ./requirements.txt ./
RUN pip install -r requirements.txt

COPY ./app ./ 
 

EXPOSE 3000

RUN useradd app_test
USER app_test

CMD ["python3", "app.py"]

