#!/bin/bash
echo 'start'
date1=$(date +%Y-%m-%d)
git add .
git status
git commit -m $date1'study tagll'
git push