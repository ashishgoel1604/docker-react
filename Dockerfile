# Specify a Base Image
FROM node:14-alpine as builder_phase
# FROM specifies a start of a new phase of build in a container
# as builder_phase means that, we are give a name to this phase
# Specify work directory, in which all the upcoming instructions will be executed
WORKDIR /app/react-frontend
# Copy package.json after step 1
COPY package.json ./
# Install dependencies based on copied package file, if anything changed
RUN npm install
# Copy rest of the files
COPY . .
# Build production build
RUN npm run build


# the above steps will generate a build folder inside /app/react-frontend directory
# After above phase(builder_phase) completion, we will start a new Phase, that will actually run the above build in container
FROM nginx
EXPOSE 80
COPY --from=builder_phase /app/react-frontend/build /usr/share/nginx/html
# now as NGINX is running from line 19, it will automatically serve the index.html