# Deploying JupyterLab on Heroku

* cnp: copy the cnp file, and then add the following to Dockerfile
  ```
  RUN chmod +x cnp
  ENV PATH="${APP_HOME}:$PATH"
  ```
* 成功安裝了 Miniconda 和 C++ kernel 和 cron，下一步是把這個裝進 legendre 然後回來這裡測試 ubuntu base image
