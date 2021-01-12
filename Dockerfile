# using official image of nginx as base image
FROM nginx

# Label is used as a reference to author of this build
LABEL MAINTAINER=umuhammad@spartaglobal.com

# copy index.html from localhost to image
COPY index.html /usr/share/nginx/html/

# launch on port 80
EXPOSE 80

# execute specified command
CMD ["nginx", "-g", "daemon off;"]
