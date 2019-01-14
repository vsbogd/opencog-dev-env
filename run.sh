#!/bin/sh
docker run -u 2001:2001 --mount='type=bind,src=/home/vital/projects/opencog,dst=/home/vital/projects' --mount='type=bind,src=/home/vital/.stack,dst=/home/vital/.stack' --network='container:nervous_dijkstra' -ti opencog  bash
