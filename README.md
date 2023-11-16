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

## Deploying website update script

The live website is updated with the `docker_deploy.sh` script.  If this has been changed (or if in doubt) deploy it to the server.

```
./deploy.sh <remote user> <deployment host address>
```

## Updating live website
1. If the last commit hasn't been tagged, tag the repo following versioning convention in current tags e.g. `v0.1.13`

2. Build image using tag version (without the v e.g. `0.1.13`). The `<docker user>` must be the name of the docker repository you plan to use

```
cd bactgen-training-app
docker build -t <docker user>/bactgen-training-app:<version> .
```

3. Push image to repository of `<docker user>`

```
docker push <docker user>/bactgen-training-app:<version>
```

4. Deploy the website to the server.
You must have ssh access to the host address. If you do not then the recent contributors of this repo that still work at the Sanger should already have access. You can ask them to add your public ssh key. Additional information on remote users and host addresses can be found [here](http://mediawiki.internal.sanger.ac.uk/index.php/Websites_managed_for_team_284_(Stephen_Bentley%27s_group)).

```
ssh <remote user>@<deployment host address> docker_deploy.sh <version> <docker registry>
```
