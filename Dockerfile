FROM node:14-alpine

# install dependencies
WORKDIR /usr/src/app
COPY package*.json ./

# like npm i
RUN npm ci

# Copy all local files into the image.
COPY . .

RUN npm run build

ENV HOST=0.0.0.0
EXPOSE 5000

CMD ["node", "./build"]