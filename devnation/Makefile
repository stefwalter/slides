all:
	@echo "make upload"

upload:
	rsync -LHvax --exclude=".git" --exclude="node_modules"  ././ file.rdu.redhat.com:public_html/tech-talk/agile-in-open-source-2016-05/./
