FROM pytorch/pytorch
USER root
# Add Tini. Tini operates as a process subreaper for jupyter. This prevents
# kernel crashes.
ENV TINI_VERSION v0.18.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /usr/bin/tini
RUN chmod +x /usr/bin/tini
ENTRYPOINT ["/usr/bin/tini", "--"]

EXPOSE 8888

# setup working directories
RUN mkdir -p /notebooks
COPY requirements.txt run_jupyter.sh README.md ./
COPY data data
COPY notebooks notebooks
RUN ls -al

# update core python packages
RUN conda config --add channels conda-forge && conda install git pip && conda update python && conda update --all
RUN pip install -r requirements.txt

CMD ["./run_jupyter.sh"]
