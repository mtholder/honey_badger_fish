# HoneyBadgerFish

See https://github.com/OpenTreeOfLife/api.opentreeoflife.org/wiki/HoneyBadgerFish for full documentation
of the NeXML <-> NexSON conversion convention.

This repo is actually a subset of the code in https://github.com/OpenTreeOfLife/api.opentreeoflife.org
and is not intended to survive for very long. It is just available to make it easier for
people to try out the conversion before the roundtrip2xml branch of the api.opentreeoflife.org repo
is ready to be merged to master.

# Usage

    $ python nexson_nexml.py input -o output

will read NeXML or NexSON as input and produce the other format in a file called output.

You can use the -m to specify the conversion mode. It expects two letter code for the 
source and destination formats: 
  x for NeXML,
  j for NexSON (using the HoneyBadgerFish convention),
  b for a direct BadgerFish translation of NeXML.

So to convert from HoneyBadgerFish to BadgerFish run:

    $ python nexson_nexml.py -m jb -o someoutfile.json otu.json

# Roundtrip tests

A test of the available format conversions (without NeXML validation) can be run with:

    $ sh check_tour.sh otu.json


If you alias your nexml validation tool to the name "validate-nexml" then you can 
run the check_nexml_roundrip.sh and check_nexson_roundrip.sh

Other dependencies for these scripts are xmllint and saxon-xslt

*Caveat*: check_nexml_roundrip.sh will fail if the attribute order differs from the order used by nexson_nexml.py


## validate-nexml command.
MTH's validate-nexml is shell script:

    #!/bin/sh
    java -jar "${NEXML_PARENT}/xml-validator-read-only/target/xml-validator-1.0-SNAPSHOT-jar-with-dependencies.jar" -s "${NEXML_PARENT}/nexml/xsd/nexml.xsd" $@

where xml-validator-read-only is from http://code.google.com/p/xml-validator/source/checkout
and nexml is a clone of https://github.com/nexml/nexml

You can tweak this by deciding on your NEXML_PARENT dir and running:

    $ cd "${NEXML_PARENT}"
    $ svn checkout http://xml-validator.googlecode.com/svn/trunk/ xml-validator-read-only
    $ git clone https://github.com/nexml/nexml.git
    $ cd xml-validator-read-only
    $ mvn package

# Attribution

The sortattr.xslt stylesheet (which is only used in round-trip testing) is from 
   http://stackoverflow.com/questions/1429991/using-xsl-to-sort-attributes other code by Mark Holder.

Jim Allman, Karen Cranston, Cody Hinchliff, Mark Holder, Peter Midford, and Jonathon Rees
all participated in the discussions that led to the NexSON mapping.
