# Use an official Python runtime as a parent image
FROM python:3.13-slim

# Set the working directory in the container
WORKDIR /app

# Install Git
RUN apt-get update && apt-get install -y git 

# Disable SSL verification
RUN git config --global http.sslVerify false

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Install dbt and any additional dbt packages
RUN pip install dbt-core dbt-postgres 

#RUN pip install dbt dbt-bigquery 

#Install dbt dependencies
RUN dbt deps

# Set environment variables
ENV DB_HOST=host.docker.internal

# Make port 8080 available to the world outside this container
EXPOSE 8080

# Run dbt when the container launches
#CMD ["dbt", "run"]

# Use the bash script as the entry point
ENTRYPOINT ["./entrypoint.sh"]