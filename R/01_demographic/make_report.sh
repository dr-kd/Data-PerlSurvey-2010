#!/bin/sh
R --no-save BATCH < analysis.R && perl -p -i -e 's/<p.*?character.*?NULL.*?\/p>//g' index.html
