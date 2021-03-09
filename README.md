# Deploying JupyterLab on Heroku

* cnp: copy the cnp file, and then add the following to Dockerfile
  ```
  RUN chmod +x cnp
  ENV PATH="${APP_HOME}:$PATH"
  ```
