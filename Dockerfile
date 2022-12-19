# BUILD PHASE
FROM node:16-alpine as builder

WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
# target product: /app/build

# RUN PHASE
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
