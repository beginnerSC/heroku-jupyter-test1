# Deploying JupyterLab on Heroku

* cnp: copy the cnp file, and then add the following to Dockerfile
  ```
  RUN chmod +x cnp
  ENV PATH="${APP_HOME}:$PATH"
  ```
* 灌 Miniconda 需要 wget。一定要用 buster base image 才有 wget，不然要自己先用 apt 灌
* Miniconda 裡其實已經有 python 了
* TODO: 
  * 試 [alpine-miniconda3](https://hub.docker.com/r/frolvlad/alpine-miniconda3)
  * [bash in alpine](https://stackoverflow.com/questions/40944479/docker-how-to-use-bash-with-an-alpine-based-docker-image)
  * [cron in alpine](https://forums.docker.com/t/how-to-run-a-cron-job-inside-a-container-alpine/7759)
