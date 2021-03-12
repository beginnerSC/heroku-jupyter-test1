# Deploying JupyterLab on Heroku

* cnp: copy the cnp file, and then add the following to Dockerfile
  ```
  RUN chmod +x cnp
  ENV PATH="${APP_HOME}:$PATH"
  ```
* 灌 Miniconda 需要 wget。一定要用 buster base image 才有 wget，不然要自己先用 apt 灌
* Miniconda 裡其實已經有 python 了
