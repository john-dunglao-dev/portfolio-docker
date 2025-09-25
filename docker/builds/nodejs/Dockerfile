FROM node:24-alpine3.21

# TODO: DO NOT INSTALL [bash, git, and vite-bundle-analyzer] "IF" IS IN PRODUCTION ENVIRONMENT

# Set aliases for commonly used tools
RUN echo "alias ll='ls -la'" >> ~/.bashrc

RUN apk update && apk add --no-cache \
    bash \
    git

RUN npm install -g vite-bundle-analyzer