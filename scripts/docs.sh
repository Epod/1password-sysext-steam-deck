#!/bin/sh
# ---
# title: Docs
# ---

# Just a little script to create documentation from the scripts. For actual documentation, see the other pages.

# This little script:
# 1.  Renames the `.sh` files to `.md` in `scripts/`
# 2.  Converts the files (and creates a 'backup' called `.md.sh`)
#     -   Deletes the shebang
#     -   Indents all non-commented, non-empty lines
#     -   Strips "`# `" from the start of every line
# 3.  Renames the `.md.sh` files back to `.sh`
# 4.  Moves the `.md` files in `scripts/` to `docs/`


rename .sh .md scripts/*.sh
sed -E -i.sh '/^#!/d; s/^([^#])/    \1/; s/^# //' scripts/*
rename .md.sh .sh scripts/*.sh
mv scripts/*.md docs/

# Old (and simpler) version:

#    cd scripts
#    for script in *.sh; do
#        sed -E '/^#!/d; s/^([^#])/    \1/; s/^# //' "${script}" > "../docs/$(echo $script | cut -d. -f1).md"
#    done

# And here is a concept of another potential '[literate](https://en.wikipedia.org/wiki/Literate_programming)' format.
# Although this script is kind of the opposite.

: << DOC
This is a multi-line string that doesn't need to be prefixed by '#'.
Unfortunately backticks would be interpreted, which could be dangerous.
We'd also need some state in the conversion script above.
DOC
