# CSIT-165

Currently this repository only contains a basic `docker-compose.yaml` for setting up RStudio Server with the user `rstudio` and the password `r` for local development use.

To run, execute the command `docker compose up -d` from within the directory, and navigate your browser to `localhost:8787`

## RStudio Setup with Docker

This repository contains a Docker Compose setup for running RStudio in a Docker container. To use this repository, you need to have Docker Desktop and Windows Subsystem for Linux (WSL) installed on your machine.

### Prerequisites

Before you begin, ensure you have met the following requirements:

* You have installed Docker Desktop. If you haven't, you can download it from the [official Docker website](https://www.docker.com/products/docker-desktop). After downloading, follow the instructions to install Docker Desktop on your machine.

* You have installed Windows Subsystem for Linux (WSL). If you haven't, you can follow the instructions provided by Microsoft in their [official documentation](https://docs.microsoft.com/en-us/windows/wsl/install-win10).

### Usage

After installing Docker Desktop and WSL, you can use this repository by running the following commands in your terminal:

1. Clone the repository:

```bash
git clone https://github.com/yourusername/yourrepository.git
```

2. Navigate to the cloned repository:

```bash
cd yourrepository
```

3. Run Docker Compose:

```bash
docker-compose up -d
```

After running these commands, you should be able to access RStudio through your browser at `http://localhost:8787`.

### Contributing

If you want to contribute to this project, please fork the repository and create a pull request. Any contributions you make are greatly appreciated.

### License

This project uses the following license: [Unlicense](LICENSE).
