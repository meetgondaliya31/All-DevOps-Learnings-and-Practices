FROM node:26-bullseye

WORKDIR /app

COPY . /app

RUN npm install

RUN npm run build

CMD ["npm", "run", "dev", "--host", "0.0.0.0"]