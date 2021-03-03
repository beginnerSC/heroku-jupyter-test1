# Minimum Example Deploying JupyterLab on Heroku

Deploy 成功但環境有問題所以 Terminal prompt 是亂碼

1. 到 heroku-jupyter-test/conf/jupyter.py 裡改密碼和 public IP address
1. ```git clone https://github.com/beginnerSC/heroku-jupyter-test```
1. ```heroku login -i```
1. ```heroku container:login```
1. ```heroku create myapp```
1. cd 到 Dockerfile 所在目錄
1. ```heroku container:push web -a myapp```
1. ```heroku container:release web -a myapp```
1. ```heroku open```

