FROM beevelop/ionic AS ionic

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies by copying
# package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm ci

# Copy app source
COPY . .

RUN ionic build


FROM nginx:alpine
COPY --from=ionic  /usr/src/app/www /usr/share/nginx/html
