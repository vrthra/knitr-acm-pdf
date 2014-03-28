EADME

## Introduction

This repository contains materials to generate a paper in pdf in ACM standard in Knitr.

## Layout

### src

This directory contains the source code in [knitr](http://yihui.name/knitr/) format.

- src/paper.Rnw
  The paper itself in Knitr, and other child documents as src/children.Rnw

- src/paper.bib
  The references used in the paper.

- etc/
  The ACM format specific files for generating pdf from pandoc markdown.
  The meta information such as title, author etc.

### build

This directory contains the generated pdf output.

## Building


### Requirements

You will need knitr to process the files.

This can be accomplished with

```
    R -q
    install.packages(c('knitr','xtable'))
```

### Generate

Run "make" from the top directory to generate build/acm\_sigproc.pdf


### Settings

Ensure that these are run in your terminal.

> git config --global diff.tool vimdiff
> git config --global difftool.prompt false
> git config --global alias.d difftool

=======
knitr-acm-pdf
=============

ACM sigproc template in knitr
