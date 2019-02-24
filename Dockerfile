FROM node:latest

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY package-lock.json package.json gulpfile.js yarn.lock /usr/src/app/

RUN yarn --pure-lockfile

# Bundle app source
COPY . /usr/src/app

EXPOSE 3002

CMD [ "npm", "run", "start"  ]