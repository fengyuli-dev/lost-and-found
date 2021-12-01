#! /bin/zsh

docker buildx build --platform linux/amd64 --push -t registry.heroku.com/fengyulilostandfound/web .
heroku container:release web --app fengyulilostandfound
# docker push fengyuli2002/lost_and_found

echo "Deployed a new version of lost_and_found"