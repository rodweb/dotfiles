#!/bin/bash

cd ~/dev/gupy-api-darthvader/
git checkout release-candidate
git pull
git checkout -
cd ~/dev/gupy-front/
git checkout release-candidate
git pull
git checkout -
cd ~/dev/gupy-database-migration/
git checkout release-candidate
git pull
git checkout -
