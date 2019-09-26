FROM pytorch/pytorch
USER root

COPY ["requirements.txt", "run_jupyter.sh"] /

# update core python packages
RUN conda update --all
RUN conda install --file requirements.txt

# setup working directories
RUN mkdir -p /notebooks
RUN ls -al

CMD ["./run_jupyter.sh"]
