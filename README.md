# pytorch_obj_detection
public experiments with pytorch and object detection tasks


# install
clone repo, make sure you have docker-desktop or docker-compose installed and running.  

Then from the terminal run:   docker build -t pytorch_obj_detection .

This will build a linux based container with the latest version of pytorch, and install all the python packages listed in requirements.txt, then it will launch jupyter notebook.

After the container is built, run it from the terminal with:  

docker run -d=false -v ${pwd}/notebooks:/notebooks -p 8888:8888 pytorch_obj_detection  
