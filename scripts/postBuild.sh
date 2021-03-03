#!/bin/bash

jupyter serverextension enable --py nbgitpuller --sys-prefix
jupyter serverextension enable voila --sys-prefix
jupyter nbextension enable --py widgetsnbextension
jupyter labextension install @jupyter-widgets/jupyterlab-manager
jupyter labextension install @jupyter-voila/jupyterlab-previewls
jupyter labextension install @ijmbarr/jupyterlab_spellchecker
jupyter labextension install @jupyterlab/debugger@0.3.3 --debug --no-build
jupyter labextension install @jupyterlab/git
jupyter labextension install @jupyterlab/toc
jupyter labextension install @pyviz/jupyterlab_pyviz
jupyter lab build --minimize=False

# echo '\n# git add commit and push in one command \n' >> .bashrc

# echo 'function cnp() {                                                                    ' >> .bashrc
# echo '    git add *                                                                       ' >> .bashrc
# echo '    git config --global user.name "beginnerSC"                                      ' >> .bashrc
# echo '    git config --global user.email "25188222+beginnerSC@users.noreply.github.com"   ' >> .bashrc
# echo '    git commit -a -m "autosave"                                                     ' >> .bashrc
# echo '    git push                                                                        ' >> .bashrc
# echo '}                                                                                   ' >> .bashrc

# sed -i 's/{article}/{article}\n\\usepackage{xeCJK}/' $(find ../../.. -name "article.tplx")
