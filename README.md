# Docker + Node

Sample Node.JS app to run in a Docker container.

## Installation & Running

To run the application in a [Docker](https://www.docker.com/) container, from the app directory:

1. Start by building the image:
    
        $ docker build -t straube/docker-node .
    
    Feel free to use other name (tag) than `straube/docker-node`. Just remember to replace the name in other commands.
    
2. Create a copy of `.env.example` file named `.env` and set all application settings properly.
    
3. Then, run the container:
    
        $ docker run --env-file '.env' -p 49160:3000 -d straube/docker-node
    
    We are redirecting the container's `3000` port to the host's `49160` port.
    
4. Optionally, to link PM2 with Keymetrics, run:
    
        $ docker exec [CONTAINER] pm2 link --no-deamon [SECRET_ID] [PUBLIC_ID]
    
    You may find the secret and public ID's in Keymetrics dashboard.

After following the steps above, you can point your browser to http://localhost:49160 (assuming you're running the 
container in your local machine).
