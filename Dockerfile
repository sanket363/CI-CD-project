# Use a Node.js runtime as the base image
FROM node:14

# Set the working directory inside the container
WORKDIR /app

# Copy the HTML and CSS files to the container
COPY index.html style.css /app/

# Expose port 3000
EXPOSE 3000

# Start a simple HTTP server to serve the HTML file
CMD ["npx", "http-server", "-p", "3000"]
