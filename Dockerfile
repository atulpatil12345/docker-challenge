# Stage 1: Build stage
FROM node:18-alpine AS build

# Set the working directory inside the build stage
WORKDIR /app

# Copy only the package.json 
COPY package.json ./

# Install dependencies
RUN npm install

# Copy the application source code
COPY app.js ./

# Stage 2: Runtime stage
FROM node:18-alpine

# Set the working directory
WORKDIR /app

# Copy only the necessary files from the build stage
COPY --from=build /app .

# Expose the application port
EXPOSE 3000

# Set an environment variable for the port 3000
ENV PORT=3000

# Start the application
CMD ["npm", "start"]

