# Dockerfile
# Use the nginx:latest image as a base
FROM nginx:latest

# Set the working directory inside the container
WORKDIR /usr/share/nginx/html


COPY ./build /usr/share/nginx/html
