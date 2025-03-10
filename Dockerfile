FROM mysterysd/wzmlx:latest

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

# Copy requirements first to leverage Docker cache
COPY requirements.txt .

# Upgrade pip, setuptools, wheel before installing requirements
RUN pip3 install --upgrade pip setuptools wheel

# Install all Python dependencies
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy the rest of the application
COPY . .

# Set appropriate permissions (if needed, depending on your app)
# RUN chmod +x start.sh  # Uncomment if start.sh is not executable already

# Run the app
CMD ["bash", "start.sh"]
