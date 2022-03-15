FROM node:14-alpine

# install dependencies
WORKDIR /app
COPY package*.json ./
RUN npm ci

# Copy all local files into the image.
COPY . .

RUN npm run build

EXPOSE 5000

CMD ["node", "./build"]