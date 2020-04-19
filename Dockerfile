FROM node:8-alpine as builder
WORKDIR /app
ADD . .
RUN npm install
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html