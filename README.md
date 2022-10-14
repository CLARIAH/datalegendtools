# DataLegend Tools

This Docker image comes pre-installed with many of the data science tools that are being developed by the [DataLegend team (WP4)](https://www.datalegend.net) within the [CLARIAH](https://www.clariah.nl) project, and which are available ready-to-use using this image.

Available applications:

- COW:           a tool to convert CSV to Linked Data (RDF)  
                 available as command 'cow_tool'  
                 see the wiki at <https://github.com/CLARIAH/COW>

- Burgerlinker:  a tool to align civil registry records  
                 available as command 'burgerlinker' (no need for 'java -jar burgerlinker.jar ...')  
                 see the wiki at <https://github.com/CLARIAH/burgerLinker>

## Getting started

This image requires the Docker virtualisation engine to be installed on your computer. Instructions on how to accomplish this can be found on the [official Docker website](https://docs.docker.com/get-docker) for Mac, Windows, and Linux operating systems. See [here](https://docs.docker.com/get-started/) for a brief introduction on how to get started with Docker.

Once you have Docker installed and running you can gain access to this image by pulling it from the Docker Hub, which can be achieved by issuing the following command in the terminal:

    # docker pull wxwilcke/datalegend

Here, the `#`-symbol refers to the terminal of a user with administrative privileges on your machine, and is not part of the command.

After the image has successfully been downloaded (or 'pulled') the container can be run as follows:

    # docker run --rm -p 3000:3000 -it wxwilcke/datalegend

The virtualised system can now be accessed by opening <http://localhost:3000/wetty> in your preferred browser, and by logging in using username **datalegend** and password **datalegend**. The container can be stopped by pressing CTRL-C, or by closing the terminal.

## Sharing files between the host and the container

To share files between the host system and the container, such as the various input and output data, a shared directory has to be created that will function as a gateway between the two systems. Any file moved to that directory on your computer will be available within the container, and any file moved there in the container will be available on your computer. Files that are saved anywhere else in the container will be gone after stopping the container.

There are two ways to achieve this: either 1) by hand, creating the necessary directories yourself, or 2) by using [git](https://git-scm.com/downloads) to clone this repository and have everything setup right from the get go. Both methods are explained below and assume you are *not running* the docker instance already.

### Manual setup

Start by creating a working directory from which the container will be run. Here, we use the name *datalegendtools* for this directory:

    $ mkdir datalegendtools

Here, the `$`-symbol refers to the terminal of a user *without* administrative privileges on your machine, and is not part of the command.

Next, enter this directory and create another directory within the working directory, called *shared*:

    $ cd datalegendtools
    $ mkdir shared

This is the directory that will connect your system to that of the container.

Finally, start the container using the following command *from within the working directory*:

    # docker run --rm -p 3000:3000 -it --mount type=bind,source=$PWD/shared,target=/home/datalegend/shared -e LOCAL_UID=$(id -u $USER) -e LOCAL_GID=$(id -g $USER) wxwilcke/datalegend

You can now use the *shared* directory to transfer file to and fro the container.

### Git setup

Ensure that you have [git](https://git-scm.com/downloads) installed on your computer, and proceed by cloning the [git repository](https://github.com/CLARIAH/datalegendtools):

    $ git clone https://github.com/CLARIAH/datalegendtools

Here, the `$`-symbol refers to the terminal of a user *without* administrative privileges on your machine, and is not part of the command.

Next, enter the newly cloned repository, and start the container using the following commands:

    $ cd datalegendtools
    # docker run --rm -p 3000:3000 -it --mount type=bind,source=$PWD/shared,target=/home/datalegend/shared -e LOCAL_UID=$(id -u $USER) -e LOCAL_GID=$(id -g $USER) wxwilcke/datalegend

You can now use the *shared* directory to transfer file to and fro the container.

## Source

The raw build files are available at our [git repository](https://github.com/CLARIAH/datalegendtools).
