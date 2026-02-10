# 1. Use a lightweight Python base image
FROM python:3.10-slim

# 2. Set the directory inside the container
WORKDIR /app

# 3. Copy the dependencies file first (for caching efficiency)
COPY requirements.txt .

# 4. Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# 5. Copy the rest of the application code
COPY . .

# 6. Define the default command to run tests
CMD ["python", "-m", "unittest", "discover", "tests"]
