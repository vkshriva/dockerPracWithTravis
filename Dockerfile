# Here we just need the output of the npm run build no code and we will use nginx server to run 
# so here we will divide this in 2 steps 1.run build and thn copy the content of tht in nginx

FROM node:alpine

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build


FROM  nginx

#here copy all contents fron /app/build to given address copied from nginx document
COPY --from=0  /app/build /usr/share/nginx/html



#u can run this prod ready using below command
#docker run -p 8080:80 <img_id> wheras 80 is the port for nginx
