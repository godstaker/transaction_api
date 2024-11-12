# Use the official Python base image from Docker Hub
FROM python:3.10-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any dependencies specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Expose port 5000 to the outside world (this is the default Flask port)
EXPOSE 5000

# Run the application when the container starts
CMD ["python", "app.py"]
