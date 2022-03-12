# java images

This project contains java versions to play with on your machine

# Install

* run `./install.sh` 
    * to create the images with the different versions installed
    * to install run scripts in you `~/bin` folder
    
# How it works

Well based on the `install.sh` script a couple of java image versions are pulled and customized
through the `Dockerfile.template` file. With the `sed` command this template file is created into a 
`Dockerfile` and build by docker into a `ivonet/j$VERSION` image.
A startup shell script is created for every version created in the `~/bin` folder with the following
naming convention `j$MAJOR_VERSION_NUMBER` e.g. `py3`

During the build the `requirements.txt` file is installed by pip, so you can use this file to prepare the 
java image according to your requirements.

Look into the `install.sh` to see which versions are currently installed.

# Running

The scripts created will run a java container based on the major version and create a 
named container for it. Except from the version these images start out "the same", but
can start varying in their state.

The run script will mount the folder you are currently standing in to the /project folder
in the container, which is the working directory for the image.

## Note

The run scripts generated assumes that you have maven installed on your local machine in the `~/.m2` folder
if not you need to adjust the `-v "${HOME}/.m2/repository:/repository"` part of the run.template.sh script
in e.g. `-v "$(pwd)/.repository:/repository"` just be sure to add the `.repository` folder to the .gitignore file.
You can also leave out this part completely but then your build will take significantly longer as the 
dependencies will have to be downloaded every time you build as the container is not kept after a run.

# Troubleshooting

It is assumed is that the `~/bin` exists and resides on the front of your PATH.

if this is not the case please edit `~/.profile` or `.bashrc` and add the following line
at the end of this file:

    export PATH=~/bin:$PATH

All should be fine now.