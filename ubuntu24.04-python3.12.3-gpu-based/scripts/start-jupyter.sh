 #! /bin/bash
nohup jupyter-lab --allow-root --ip=* --port=9080 --NotebookApp.token='' --NotebookApp.password='' --no-browser > /app/log/jupyter.log 2>&1 &
