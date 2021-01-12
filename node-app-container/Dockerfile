# using official image of node as base image
FROM node

# Label is used as a reference to author of this build
LABEL MAINTAINER=umuhammad@spartaglobal.com

# Create new directory to hold app, if it doesn't already exist
WORKDIR /usr/src/app

# copy app folder from localhost to directory which will hold app in 
image
COPY app ./

# install modules/dependencies
RUN npm install

# launch on port 3000
EXPOSE 3000

# execute command to run app.js file
CMD ["node", "app.js"]
