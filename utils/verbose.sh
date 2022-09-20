#!/bin/bash

files=$(node ./startVerboseProjects.js)
"docker-compose "$files" --env-file ./config/.env up"