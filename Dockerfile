FROM node:20.0
# Install the latest version of Node.js and npm
ENV TZ="Asia/Kolkata"
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install tzdata -yq
RUN ln -fs /usr/share/zoneinfo/Asia/Kolkata /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata
RUN mkdir sourcecode
RUN cd sourcecode
RUN mkdir dashboard-automation
RUN cd ..
WORKDIR /sourcecode/dashboard-automation/
COPY . /sourcecode/dashboard-automation/
RUN npm install -D @playwright/test
RUN npx playwright install
RUN npx playwright install-deps
