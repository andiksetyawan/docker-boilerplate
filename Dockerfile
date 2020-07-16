#build node_app
FROM node:12 as node_app_image

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY node_app/package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY node_app .

EXPOSE 3000
CMD [ "node", "server.js" ]


#build golang app
FROM golang:1.14.5 as go_app_image

COPY go_app /app

CMD ["go","run","/app/main.go"]