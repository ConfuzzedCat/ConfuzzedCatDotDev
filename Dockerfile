# First stage: build the react app
# FROM tiangolo/node-frontend:10 as build-stage
FROM node:18 as build-stage
WORKDIR /app
COPY package*.json /app/
RUN npm install
COPY . .
RUN npm run build
COPY LICENSE /app/dist/LICENSE.txt

# Second stage: use the build output from the first stage with nginx
FROM nginx:1.25
COPY --from=build-stage /app/dist/ /usr/share/nginx/html

# Copy the default nginx.conf to get the try-files directive to work with react router
COPY ./docker.nginx.conf /etc/nginx/conf.d/default.conf
