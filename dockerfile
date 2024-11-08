# Use a base image with Python and necessary dependencies
FROM python:3.11

# Set the working directory in the container
WORKDIR /app

# Copy the local Streamlit app code to the container
COPY . /app

# Update Packages
RUN apt-get update && apt-get upgrade -y

# Update PIP
RUN pip install --upgrade pip

# Install dependencies
RUN pip install streamlit awswrangler pandas

# Expose the port Streamlit will run on
EXPOSE 8501

# Set Timezone
ENV TZ="America/Chicago"

# Install CURL for HealthCheck
RUN apt-get install curl -y

# Command to run Streamlit when the container starts
CMD ["streamlit", "run", "home.py"]

HEALTHCHECK CMD curl --fail http://localhost:8501 || exit 1