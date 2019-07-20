# Build phase
FROM node:alpine as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
# This puts it in /app/build
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
