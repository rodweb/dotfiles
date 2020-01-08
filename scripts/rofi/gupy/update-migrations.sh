#!/bin/bash

cd ~/dev/gupy-database-migration
git pull
npm start
npm run migrate-test
