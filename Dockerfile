# Use a lightweight base image with Python 3.9
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the Python script into the container
COPY generate_qr.py .

# Install the required dependencies
RUN pip install qrcode[pil]

# Define environment variables with default values (optional)
ENV QR_DATA_URL="https://github.com/kaw393939" \
    QR_CODE_DIR="qr_codes" \
    QR_CODE_FILENAME="github_qr_code.png"

# Create a directory inside the container to store the QR code images
RUN mkdir -p /app/${QR_CODE_DIR}

# Entrypoint to execute the Python script when the container starts
ENTRYPOINT ["python", "generate_qr.py"]
