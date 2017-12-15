#!/bin/bash

# Sean R. Lang

branch=`git branch | awk '{print \$2}'`

for rem in `git remote`; do
	git push $rem $branch
done
