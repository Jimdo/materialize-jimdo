#!/bin/bash

#* only when in master
if [ $TRAVIS_BRANCH == 'master' ] && [ $TRAVIS_PULL_REQUEST == false ]; then

	#* Configure git for push to gh-pages
	git config --global user.email "template-team@jimdo.com"
	git config --global user.name "JimdoTemplateCI"
	git config credential.helper "store --file=.git/credentials"
	echo "https://${GH_TOKEN}:@github.com" > .git/credentials

	#* checkout current gh-pages
	cd patternlab
	git clone git@github.com:Jimdo/jimdo-ui-lib.git -b gh-pages --single-branch _site/

	#* build new
	jekyll build --config _config.yml,_configGhPages.yml
	../node_modules/.bin/bower install
	#copy vendor assets
	cp -r bower_components/ _site/bower_components

	#* commit and push to gh-pages
	cd _site/
	git add --all
	git commit -m'update gh-pages'
	git push origin gh-pages
	cd ../..
fi
