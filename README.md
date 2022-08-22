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

This image requires the Docker virtualisation engine to be installed on your computer. Instructions on how to accomplish this can be found on the [official Docker website](https://docs.docker.com/get-docker) for Mac, Windows, and Linux operating systems.

Once you have Docker installed and running you can gain access to this image by pulling it from the Docker Hub, which can be achieved by issuing the following command in the terminal:

    $ docker pull wxwilcke/datalegend

After the image has successfully been downloaded (or 'pulled'), create a directory called *shared*, and start the container using the following command:

    $ docker run --rm -p 3000:3000 -it --mount type=bind,source=$PWD/shared,target=/home/datalegend/shared -e LOCAL_UID=$(id -u $USER) -e LOCAL_GID=$(id -g $USER) datalegend

The virtualised system can now be accessed by opening <http://localhost:3000/wetty> in your preferred browser, and by logging in using username *datalegend* and password *datalegend*. The container can be stopped by pressing CTRL-C.

The *shared* directory functions as a gateway between the local filesystem and that of the container, enabling you to move files to and fro the container. Any file stored there on your computer will be available within this container, and any output file moved there in this container will be available on your computer. Files that are saved anywhere else in this container will be gone after stopping the container.

## Source

The raw build files are available at our [git repository](https://github.com/wxwilcke/datalegendtools).
