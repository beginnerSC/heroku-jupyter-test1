FROM python:3.8.2-slim

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
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN chmod +x cnp
ENV PATH="${APP_HOME}:$PATH"

RUN pip install --upgrade pip && pip install -r requirements.txt

CMD ["./scripts/postBuild.sh"]
CMD ["jupyter", "lab", "--config", "./jupyter_notebook_config.py"]
