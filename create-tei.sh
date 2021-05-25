#!/usr/bin/env sh

# This script converts the XMI files into TEI files. It uses the CorefAnnotator (https://github.com/nilsreiter/CorefAnnotator/releases/latest) for conversion.
# A soft link with the path to CorefAnnotator's jar file (e.g. 'CorefAnnotator-1.14.3-full.jar') needs to be create under the name 'path-to-corefannotator'; alternatively, you can change the value of the variable $PATHTOCOREFANNOTATOR to the path inside this script.

PATHTOCOREFANNOTATOR=path-to-corefannotator
INPUTDIR=./xmi
OUTPUTDIR=./tei

java -cp $PATHTOCOREFANNOTATOR de.unistuttgart.ims.coref.annotator.tools.ExportMultipleFiles --outputFormat tei --input "$INPUTDIR" --outputDirectory "$OUTPUTDIR"
