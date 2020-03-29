#build phase

FROM node:alpine as builder

WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#Run phase

FROM nginx
EXPOSE 80
copy --from=builder /app/build/ /usr/share/nginx/html

