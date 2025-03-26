# Base image with all dependencies
FROM python:3.9-slim as builder

WORKDIR /app
COPY requirements.txt .

# Install production dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY app/ ./app/

# Test stage
FROM builder as tester

# Install test dependencies
RUN pip install --no-cache-dir pytest

# Copy test files (if any)
COPY tests/ ./tests/
COPY test_*.py ./

# Production stage
FROM builder as production

EXPOSE 5000
CMD ["python", "app/main.py"]
