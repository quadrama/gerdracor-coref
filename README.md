[![release](https://img.shields.io/github/release-pre/quadrama/gerdracor-coref.svg)](https://github.com/quadrama/gerdracor-coref/releases/latest)
[![DOI](https://zenodo.org/badge/223186468.svg)](https://zenodo.org/badge/latestdoi/223186468)
[![license](https://img.shields.io/badge/license-CC0.svg)](https://github.com/quadrama/gerdracor-coref/blob/master/LICENSE)

# GerDraCor-Coref

## General Information

The GerDraCor-Coref (German Drama Corpus for Coreference) is a fork of the [GerDraCor](https://github.com/dracor-org/gerdracor) and contains coreference annotations for a subset of the GerDraCor texts. The texts are all German dramatic texts, written between 1730 and 1920. Annotated are all noun phrases, singletons were removed. Additionally, generic entities, abstract anaphora and amiguous mentions are also marked explicitely. In case of the latter two, only a part of the corpus has been annotated.

### File Naming

The names of the files are composed of a short form of the title of the play and an appropiate file ending indicating the format, e.g. `Rosenkavalier.xmi`, `Rosenkavalier.xml`, `Rosenkavalier.conll` for "Der Rosenkavalier" by Hugo von Hofmannsthal. A full list of file names and their corresponding play is given in `plays.csv`.

### Partial Annotations

Some texts have not been fully annotated, but only one or more acts. The act(s) annotated are indicated in the filename, e.g. `Manuscript_Act5.xmi`. If the full text was annotated, no special marker is applied, e.g. `Sara.xmi`.

### Parallel Annotations

In order to make Inter-Annotator agreement studies possible, we carried out parallel annotations of single acts, annotated by distinct annotators. These annotations are located in separate branches and the annotator and act is additionally indicated in the filename, e.g. `Sara_AS_Act1`. `gold` annotations are not specially marked in the filename. (ToDo)

### Encoding

All files are encoded in UTF-8 Unicode.

## Formats

We provide several formats to represent the coreference annotations:

- XMI
- TEI
- CoNLL 2012
- DIRNDL

For the texts that have not been fully annotated, we additionally provide TEI output only for the parts that have been annotated. The CoNLL output always only contains the annotated parts. The XMI output always contains the full text.

### XMI

As the XMI files can become quite large, they have been compressed using `gzip`. Uncompress them by entering a command line and run

```sh
$ gzip -d <FILENAME>.xmi.gz
```

### DIRNDL

DIRNDL is a file format based on the CoNLL format, but additionally also contains a speaker column (among others).

## Organization

The annotations are sorted into folders according to the different output formats.
Parallel annotations by different annotators are organized into branches in the git tree. The main annotations are located in the `gold` branch. Partial annotations are sorted under the main folder in a subfolder called `part`.

### Folder structure

```sh
$ tree -d
.
├── conll
│   └── part
├── tei
│   └── part
└── xmi
```

### Branches

```sh
$ git branch
* gold
```

## License

Like [GerDraCor](https://github.com/dracor-org/gerdracor), GerDraCor-Coref is released under the [Creative Commons Zero copyright waiver CC0](https://creativecommons.org/share-your-work/public-domain/cc0/).

## Contribution

We appreciate contributions regarding extensions, bug fixes and the like. Please feel free to create issues or pull requests.
