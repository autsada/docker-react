# build process
FROM node:alpine as builder
WORKDIR /usr/app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# nginx process
FROM nginx
EXPOSE 80
# copy build folder to nginx location
COPY --from=builder /usr/app/build /usr/share/nginx/html