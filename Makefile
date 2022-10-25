all: run-pipeline

run-pipeline: create-tei split-tei split-tei-parallel create-conll adjust-conll-header

create-tei: create-tei.sh
	./create-tei.sh

create-conll: create-conll.sh
	./create-conll.sh

split-tei: split_tei.py
	python3 split_tei.py tei/ tei/part/ --addScenes

split-tei-parallel: split_tei.py parallel_annotations/split_tei_parallel.sh
	cd ./parallel_annotations && \
        ./split_tei_parallel.sh

adjust-conll-header: parallel_annotations/adjust_conll_header.sh
	cd ./parallel_annotations && \
	./adjust_conll_header.sh

.PHONY: all
