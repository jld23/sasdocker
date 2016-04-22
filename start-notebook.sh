#!/bin/bash

exec jupyter notebook --no-browser > /var/log/jupyter.log 2>&1 $*
