FROM node:24-alpine3.21

# Set aliases for commonly used tools
RUN echo "alias ll='ls -la'" >> ~/.bashrc

RUN apk add --no-cache \
    bash \
    git

RUN npm install -g vite-bundle-analyzer