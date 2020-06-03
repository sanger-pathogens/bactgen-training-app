# Bioinformatics training documentation
[See the site (https://training.bactgen.sanger.ac.uk/)](https://training.bactgen.sanger.ac.uk/)

This repo contains [docsify](https://docsify.now.sh/) generated documentation for the [JUNO](https://www.gbsgen.net/) and [GPS2](https://www.pneumogen.net/gps/index.html) global genomic sequencing projects.

## Development guidance:

### Content
To add or change content, edit the markdown files.

### Styling
Styling is largely managed by [docsify-themeable](https://jhildenbiddle.github.io/docsify-themeable/). If you want to change something, please check the [available customisations](https://jhildenbiddle.github.io/docsify-themeable/#/customization) and add an appropriate override in the `index.html` file (under the `:root` style tag).

Try to avoid embedding HTML in the markdown files if possible.

### References
All references, in links and images, should be relative to the project root, eg. `/F1/microreact.md`.