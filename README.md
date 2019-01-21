# README

This project can be executed running the following commands

* This commmand will create the database

docker run --name url_shortener_api_development -e POSTGRES_USER=url_short -e POSTGRES_DB=url_shortener_api_development -e POSTGRES_PASSWORD='url_short!23' -d -p 5431:5432 postgres

docker-compose build
docker-compose up

And now the project can be accessed on 0.0.0.0:3000

Use Cases

* Create short URL

curl -X POST \
  'http://0.0.0.0:3000/url_shortener?original_url=http://www.google.com' \
  -H 'Postman-Token: 7f677ba0-4bc7-4e7a-94fb-06f891c4e313' \
  -H 'cache-control: no-cache'
  
  
* Go to original URL using shortened url

curl -X GET \
  http://0.0.0.0:3000/url_shortener/MP8ldcil7n8= \
  -H 'Postman-Token: c29b9829-cade-4840-a184-43b59a7491f6' \
  -H 'cache-control: no-cache'
  
  