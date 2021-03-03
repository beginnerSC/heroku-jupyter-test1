FROM python:3.8.2-slim

ENV APP_HOME /app
WORKDIR ${APP_HOME}

COPY . ./

RUN apt-get update && apt-get install -y --no-install-recommends \
    texlive-fonts-recommended \
    texlive-generic-recommended \
    texlive-latex-base \
    texlive-latex-extra \
    texlive-latex-recommended \
    texlive-publishers \
    texlive-science \
    texlive-xetex \
    texlive-lang-chinese \
    tree \
    git \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN pip install pip pipenv --upgrade

RUN pip install numpy scipy pandas jupyterlab seaborn matplotlib scikit-learn jupyterlab jupyterlab-git voila rise nbdime nodejs notebook ptvsd xeus-python==0.9.0 yfinance schedule panel hvplot get-all-tickers pyDiffMap arch pandas_ta xgboost

CMD ["./scripts/postBuild.sh"]
CMD ["./scripts/entrypoint.sh"]
