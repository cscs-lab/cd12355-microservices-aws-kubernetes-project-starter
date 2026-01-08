FROM python:3.10-bullseye

# Create a directory for your application
RUN mkdir /src

WORKDIR /src
COPY . /src/

# Install required dependencies  
RUN apt update -y && apt install -y build-essential libpq-dev
RUN pip install --upgrade pip setuptools wheel && pip install -r requirements.txt
RUN apt install -y postgresql-client
RUN pip install python-dotenv

# set the environment variables
ENV DB_USERNAME=${DB_USERNAME}
ENV DB_PASSWORD=${DB_PASSWORD}
ENV DB_HOST=${DB_HOST}
ENV DB_PORT=${DB_PORT}
ENV DB_NAME=${DB_NAME}

# Expose app port 5153
EXPOSE 5153

# Run below command when the container spins up
CMD python app.py
