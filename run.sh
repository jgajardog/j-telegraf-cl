#!/bin/bash

tagname=0.0.1
sudo docker build --no-cache -t jgajardog/j-telegraf-cl:$tagname .
sudo docker push jgajardog/j-telegraf-cl:$tagname
