# DataLegend Playground

This Docker image comes pre-installed with many of the data science tools that are being developed by the [DataLegend team (WP4)](https://www.datalegend.net) within the [CLARIAH](https://www.clariah.nl) project, and which are available ready-to-use using this image.

Available applications:

- COW:           a tool to convert CSV to Linked Data (RDF)  
                 available as command 'cow_tool'  
                 see the wiki at <https://github.com/CLARIAH/COW>

- Burgerlinker:  a tool to align civil registry records  
                 available as command 'burgerlinker' (no need for 'java -jar burgerlinker.jar ...')  
                 see the wiki at <https://github.com/CLARIAH/burgerLinker>

## Getting started

This image requires the Docker virtualization engine to be installed on your computer. Instructions on how to accomplish this can be found on the [official Docker website](https://docs.docker.com/get-docker) for Mac, Windows, and Linux operating systems.

Once you have Docker installed and running you can gain access to this image by pulling it from the Docker Hub, which can be achieved by issuing the following command in the terminal:

`docker pull wxwilcke/datalegend`

After the image has successfully been downloaded (or 'pulled') there are two ways to continue: either 1) clone the [git repository](https://github.com/wxwilcke/datalegendtools) and use our helper scripts, or 2) run all necessary commands yourself (for advanced users). 

### Using GIT

Start by installing the [Docker Compose Desktop](https://docs.docker.com/compose/install/compose-desktop), which enables us to use simple scripts that automate the starting of containers and that enables us to setup the correct environment.

Next, clone the [git repository](https://github.com/wxwilcke/datalegendtools) that provides these scripts:

`git clone https://github.com/wxwilcke/datalegendtools`

Once clone, enter the right directory and execute Docker compose to start the container:

    cd datalegendtools
    docker-compose up

The above command will start the container. You can now access the running container using your preferred browser, by going to <http://localhost:3000/wetty> and by logging in with user 'datalegend' and password 'datalegend'.

Rather than running the `docker-compose` command yourself, you can also run the `run.sh` (Mac, Linux) or `run.bat` (Windows) scripts to start and stop the container.

### Using Docker only

To start the container without using the helper scripts, execute the following command:

`docker run --rm -p 3000:3000 -v ./:/home/datalegend/shared`

After a couple of seconds you access the running container using your preferred browser, by going to <http://localhost:3000/wetty> and by logging in with user 'datalegend' and password 'datalegend'.

## Building the image from scratch

Instead of pulling the image from Docker Hub, you can also build it yourself by going into the `build` directory of the repository, and by issuing the following command:

`docker build -t datalegend .`
