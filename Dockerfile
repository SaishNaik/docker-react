FROM node:16-alpine as build
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx:1.25.1-alpine
COPY --from=build /app/build /usr/share/nginx/html



