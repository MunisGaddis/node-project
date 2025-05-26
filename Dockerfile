# Use official Node.js Alpine base image
FROM node:12.2.0-alpine

# Set working directory
WORKDIR /node

# Copy dependency files first for better caching
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy rest of the app code
COPY . .

# Run test script
RUN npm run test

# Expose application port
EXPOSE 8000

# Start the app
CMD ["node", "app.js"]
