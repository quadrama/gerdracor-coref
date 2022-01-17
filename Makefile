run-pipeline: create-tei.sh create-conll.sh split_tei.py
	./create-tei.sh
	./create-conll.sh
	python3 split_tei.py tei/ tei/part/ --addScenes

create-tei: create-tei.sh
	./create-tei.sh

create-conll: create-conll.sh
	./create-conll.sh

split-tei: split_tei.py
	python3 split_tei.py tei/ tei/part/ --addScenes
