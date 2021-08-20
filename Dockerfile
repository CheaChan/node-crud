FROM node:12-alpine
RUN npm install express express-fileupload body-parser mysql ejs req-flash --save
RUN npm install nodemon -g
#RUN apk update
#RUN apk upgrade
#RUN apk add bash

WORKDIR /app
COPY . .
COPY package.json package-lock.json app.js create_db.sql /app
RUN yarn install --production
CMD ["nodemon", "app.js"]
