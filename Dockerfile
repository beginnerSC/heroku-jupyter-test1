FROM ubuntu:18.04

ENV PATH="/root/miniconda3/bin:${PATH}"
ARG PATH="/root/miniconda3/bin:${PATH}"
RUN wget \
    https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && mkdir /root/.conda \
    && bash Miniconda3-latest-Linux-x86_64.sh -b \
    && rm -f Miniconda3-latest-Linux-x86_64.sh 

RUN conda install xeus-cling -c conda-forge

ENV APP_HOME /app
WORKDIR ${APP_HOME}

COPY . ./

RUN apt-get update && apt-get install -y --no-install-recommends \
#     texlive-fonts-recommended \
#     texlive-generic-recommended \
#     texlive-latex-base \
#     texlive-latex-extra \
#     texlive-latex-recommended \
#     texlive-publishers \
#     texlive-science \
#     texlive-xetex \
#     texlive-lang-chinese \
#     pandoc \
#     tree \
    git \
#     cron \
#     nano \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN chmod +x cnp
ENV PATH="${APP_HOME}:$PATH"

RUN pip install --upgrade pip && pip install -r requirements.txt

CMD ["./scripts/postBuild.sh"]
CMD ["jupyter", "lab", "--config", "./jupyter_notebook_config.py"]
