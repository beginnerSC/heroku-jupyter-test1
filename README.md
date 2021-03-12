# Deploying JupyterLab on Heroku

* cnp: copy the cnp file, and then add the following to Dockerfile
  ```
  RUN chmod +x cnp
  ENV PATH="${APP_HOME}:$PATH"
  ```
* 成功安裝了 Miniconda，C++ kernel，cron 和 nano，下一步是把這個裝進 legendre 然後回來這裡測試 ubuntu base image
  * 灌 Miniconda 需要 wget。一定要用 buster base image 才有 wget，不然要自己先用 apt 灌
* Miniconda 裡其實已經有 python 了
