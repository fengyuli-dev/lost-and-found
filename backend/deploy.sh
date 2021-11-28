#! /bin/zsh

heroku container:push web --app fengyuli-lost-and-found
heroku container:release web --app fengyuli-lost-and-found
# docker build -t fengyuli2002/lost_and_found .
# docker push fengyuli2002/lost_and_found

echo "Deployed a new version of lost_and_found"