FROM node

# Install the latest version of Node.js and npm
ENV TZ="Asia/Kolkata"
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install -yq tzdata && \
    ln -fs /usr/share/zoneinfo/Asia/Kolkata /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata

WORKDIR /sourcecode/dashboard-automation/

COPY . .

RUN npm install -D @playwright/test && \
    npx playwright install && \
    npx playwright install-deps
