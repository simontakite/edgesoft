FROM node:latest

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json gulpfile.js yarn.lock /usr/src/app/

RUN yarn --pure-lockfile
RUN npm install

# Bundle app source
COPY . /usr/src/app

EXPOSE 3002

CMD [ "npm", "run", "start"  ]
