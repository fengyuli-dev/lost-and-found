#! /bin/zsh

docker build -t fengyuli2002/lost_and_found .
heroku container:push web --app fengyulilostandfound
heroku container:release web --app fengyulilostandfound
docker push fengyuli2002/lost_and_found

echo "Deployed a new version of lost_and_found"