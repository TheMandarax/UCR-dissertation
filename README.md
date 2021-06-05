UCR Dissertation 
================

  - [Good GIT practice in Rstudio.](#good-git-practice-in-rstudio.)
  - [File structure.](#file-structure.)
  - [Useful citation commands.](#useful-citation-commands.)
  - [Referencing figures.](#referencing-figures.)
  - [Formating vector images](#formating-vector-images)
  - [Data](#data)

Edits should be made to the pichia.Rmd file. Try to keep single
sentences (or clauses) per line, to avoid unnecessary merge conflicts.

## Good GIT practice in Rstudio.

1.  Create a new project in Rstudio, selecting import from GIT.
2.  Use this URL: `https://github.com/jchartron/pichiapaper.git`.
3.  Update your project regularly with the `pull` command in the Git
    window (default in top left pane). This will reduce the likelihood
    of merge conflicts.
4.  Commit your changes locally by with the `commmit` button. Stage any
    changed files. Make sure you have a commit message.
5.  Push your changes back to the repository with the upward arrow
    button.
6.  Try to resolve your merge conflicts.

***Remember*** that any git flags *any* change on a line. If two people
commit changes to a very long line, there will be a conflict.

## File structure.

1.  pichia.Rmd, elsarticle.cls and mybibfile.bib files should be kept in
    the top level directory.
2.  Bibliography formats are stored in **bibformat**.

## Useful citation commands.

1.  References can be copied from Paperpile by ctrl-B, and pasted into
    mybibfile.bib
2.  Citations can be copied by Paperpile by ctrl-K, and placed within
    \[@ \], for example \[@Wang2017-iq\].
3.  Multiple citations should be seperated by a ;
    \[@Wang2017-iq;@Sanchez-Garcia2016-rf\].
4.  Paperpile automatically generates the two-letter code, and in my
    3000+ paper library, I’ve only had 1 conflict.

## Referencing figures.

Within an r code block, the variable immediately after ` ```{r ` is the
figure NAME. You can reference the number as `\@ref(fig:NAME)`. If we
rearrange figures, the text will respond accordingly.

## Formating vector images

Convert line art into a postscript image. Use the command
`grImport::PostScriptTrace("filename.ps")` to create an .xml version.
This step requires ghostscript to be available in your path. Then, the
.xml can be loaded with `object <-
grImport::readPicture("filename.ps.xml")` and turned into a Grob object
with `grob <- grImport::pictureGrob(object)`, where `grob` is whatever
name you choose. `grob` can be used with any `grid` based graphics
program, such as `cowplot`. I haven’t tried this yet with images which
contain bitmaps, but hopefully it works\!

Images and .xml should be stored in the **images** directory.

## Data

Add any significant .Rdata files to the **data** directory. Avoid saving
session data. Keep names simple and clear.
