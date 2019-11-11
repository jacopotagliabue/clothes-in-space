# clothes-in-space
Personalization with deep learning in 100 lines of code

### Overview
This repository contains the companion code to the "Clothes in Space" blog post.

### How to run the notebook
#### Coding
Running the full notebook in the original architecture requires Python 3 with 
dependencies installed and access to Elasticsearch >7.4 and [Redis](https://redis.io/): 
to get Elastic up 
and running locally and quickly, 
the [docker](https://www.elastic.co/guide/en/elasticsearch/reference/7.4/docker.html) setup
is recommended. 

Once you have the two databases up and running, fill the variables in the notebook to let the
Python clients successfully connect.

#### Docker support
Thanks to Luca Bigon, we now have docker-compose support. To run it with Docker:

1. `docker-compose build` to build the Jupyter container;
2. `docker-compose up --force-recreate` to start the stack (Jupyter, Redis and ElasticSearch); a link (e.g. `http://127.0.0.1`) with a temporary token will be printed in the cli;
3. `docker-compose down` to shut down all the containers.

#### Data
There are two main embedding examples in the code, word embeddings and product embeddings:

* word embeddings in the text were generated with the 1bn word corpus. A copy of the file can be downloaded 
[here](https://drive.google.com/file/d/1XrmkevxgSc-jtsBXszavKvPfrPTx2iv0/view?usp=sharing);

* product embeddings in the text were generated through real session data from commerce stores. 
To create embeddings from your session data you will need to provide data from your store. 
For your convenience, a sample session file is included in the repo: 
if your session data are formatted in the same way, the repo can be run with no changes.

To run the notebook end-to-end you will also need to provide a "catalog" file and 
some test SKUs (i.e. product identifiers) to visualize analogies and similarities. 
For your convenience a sample catalog file is included in the repo. 

### Status
This is a WIP repo for my latest blog post. Come back soon for the full version!

### License
All the code is released "as in" under an MIT license.
