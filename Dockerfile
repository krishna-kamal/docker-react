#specify base image
FROM node:alpine as builder

#Install some dependencies
WORKDIR '/usr/app'
COPY ./package.json ./
RUN npm install
COPY ./ ./
RUN npm run build
#Default Command
#CMD ["npm", "start"]

FROM nginx
COPY --from=builder /usr/app/build /usr/share/nginx/html