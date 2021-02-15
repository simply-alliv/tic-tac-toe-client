FROM node:14.15.5-alpine

# Create app directory
WORKDIR /usr/src/app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

# RUN npm install
# If you are building your code for production
RUN npm ci --only=production
RUN npm install react-scripts@3.4.1 -g

# Bundle app source
COPY . .

EXPOSE 3000
CMD ["npm", "start"]