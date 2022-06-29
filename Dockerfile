FROM nginx:alpine
RUN apk install -y zip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /usr/share/nginx/html/
WORKDIR /usr/share/nginx/html/
RUN unzip photogenic.zip
RUN cp -rvf photogenic/* .
EXPOSE 80 22
RUN rm -rf photogenic photogenic.zip
CMD ["nginx", "-g", "daemon off;"]