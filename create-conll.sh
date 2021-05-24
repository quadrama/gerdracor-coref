#!/usr/bin/env sh

# This script takes the TEI/XML files from the tei/ directory and converts them into different CoNLL formats.
# For the conversion, DramaNLP (https://github.com/quadrama/DramaNLP/releases/latest) is used, which needs to be installed for this to work.
# A soft link with the location to DramaNLP's main jar file ('de.unistuttgart.ims.drama.main/target/assembly/drama.Main.jar) needs to be created under the name 'path-to-dramanlp'; alternatively, you can change the value of the variable $PATHTODRAMANLP to the actual path in this script


PATHTODRAMANLP=path-to-dramanlp
INPUTDIRFULLPLAYS=./tei/full
INPUTDIRPART=./tei/part
OUTPUTDIR=./conll
OUTPUTDIRPART=./conll/part
CORPUS=GERDRACOR

# Process full plays
java -cp $PATHTODRAMANLP  de.unistuttgart.ims.drama.main.TEI2XMI --input $INPUTDIRFULLPLAYS --conllOutput $OUTPUTDIR --parse --skipSpeakerIdentifier --corpus $CORPUS --doCleanup --manualCoreference --createCoreferenceGroups

# Process partially annotated plays
java -cp $PATHTODRAMANLP de.unistuttgart.ims.drama.main.TEI2XMI --input $INPUTDIRPART --conllOutput $OUTPUTDIRPART --parse --skipSpeakerIdentifier --corpus $CORPUS --doCleanup --manualCoreference --createCoreferenceGroups
