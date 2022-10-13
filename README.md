
# libRadtran-container

A containerized version of [libRadtran](http://www.libradtran.org).

## Setup

Install [Docker](https://www.docker.com/) or [Podman](https://podman.io/).

Clone and `cd` to the project directory.

Build the container:

`docker build -t libradtran-container .`

## Usage

### Starting the container

Start the container interactively with: 

`docker run -it rt bash`

Start the container interactively with a volume mount (expects the directory `./Mount`): 

`docker run -v "$(pwd)"/Mount:/libRadtran-2.0.4/Mount -it libradtran-container bash`

### Running `uvspec`

Simply type `uvspec`. The default working directory is `/libRadtran-2.0.4` and `uvspec` is already added to the PATH.

Example: `uvspec < UVSPEC_EXAMPLE.INP > UVSPEC_EXAMPLE.OUT`

Detailed `uvspec` usage is covered in the [libRadtran documentation](http://www.libradtran.org/doku.php?id=basic_usage).
