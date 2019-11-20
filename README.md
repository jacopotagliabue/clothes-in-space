# clothes-in-space
Personalization with deep learning in 100 lines of code

### Overview
This repository contains the companion code to the "Clothes in Space" blog post.

### How to run the notebook
#### Install dependencies (manual)
Running the full notebook in the original architecture requires Python 3 with 
dependencies installed and access to Elasticsearch or Coveo and [Redis](https://redis.io/): 
to get Elastic up and running locally and quickly, the [docker](https://www.elastic.co/guide/en/elasticsearch/reference/7.4/docker.html) setup
is recommended.

#### Docker support (semi-auto)
We also support building the env with docker-compose. To run the POC with Docker:

1. `docker-compose build` to build the Jupyter container;
2. `docker-compose up --force-recreate` to start the stack; a link (e.g. `http://127.0.0.1`) with a temporary token will be printed in the cli;
3. `docker-compose down` to shut down all the containers.

#### Coding
Once you have everything up and running, fill the variables in the notebook to let the
Python clients successfully connect to the databases (fill also catalog-specific variables you know
based on your specific input file). Please note that depending on your exact setup 
(Redis or memory, Elasticsearch or Coveo index, etc.), you may want to 
use specific portions of the notebook: for this reason, different "versions" of key functions are clearly
marked in the code.

#### Data
There are two main embedding examples in the code, product embeddings and word embeddings:

* product embeddings in the text were generated through real session data from commerce stores. 
To create embeddings from your session data you will need to provide data from your store. 
For your convenience, a sample session file is included in the repo: 
if your session data are formatted in the same way, the repo can be run with no changes;

* word embeddings in the text were generated with the 1bn word corpus. A copy of the file can be downloaded 
[here](https://drive.google.com/file/d/1XrmkevxgSc-jtsBXszavKvPfrPTx2iv0/view?usp=sharing); please note that 
if you use the Docker setup the file will be downloaded automatically and available in the `/tmp/corpus.txt` path.

To run the notebook end-to-end you will also need to provide a "catalog" file and 
some test SKUs (i.e. product identifiers) to visualize analogies and similarities. 
For your convenience a sample catalog file is included in the repo: 
if you put `catalog` and `sessions` files in the `data` folder,
you can then use in the notebook `/notebooks/data` as your `DATA_FOLDER`. 

*Please note that the sample files (catalog and sessions) are NOT enough to run the notebook end-to-end: 
those files are just provided as syntactic examples of \*real\* files you may want to use to reproduce the 
personalization effect explained in the original blog post.* 

#### Data format
To use your own `catalog` and `sessions` files, follow the sample files provided in the repo. In particular:

* `catalog.csv` is a csv file with four columns `sku`, `name`, `target`, `image`: `sku` is the product identifier;
* `sessions.txt` is a TAB separated txt file storing a session on each line; each session has a numerical id first and then
the list of SKUs (matching the content of `catalog.csv`, obviously) that were viewed in that session.

### Status
This is a WIP repo for my latest blog post. Come back soon for the full version!

### Acknowledgments
Thanks to [Luca Bigon](https://github.com/bigluck) for adding `docker-compose` support and for the
usual helpful comments; thanks to [Francis Turgeon-Boutin](https://github.com/francistb) for helping
with Coveo's setup and general feedback on the project.

### License
All the code is released "as in" under an MIT license.
