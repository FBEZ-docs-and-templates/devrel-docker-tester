# devrel-docker-tester

This Docker setup provides a portable and reproducible development environment for testing tools, scripts, and Hugo-based site generation for the [`developer-portal`](./developer-portal) repo.

It includes:
- Ubuntu 22.04 base image
- Git (with configurable name/email)
- Python 3 & pip
- Hugo Extended (architecture-specific)


## 🛠️ Purpose

This container is designed to help you:

- Test code changes to the Developer Portal in a clean environment
- Run Hugo locally without installing it on your system
- Use consistent Git and Python tooling inside the container
- Share a mounted volume with your local `./developer-portal` repository



## 🚀 Usage

### 1. Build the Docker Image

```bash
docker build -t dev-hugo \
  --build-arg GIT_USER="Your Name" \
  --build-arg GIT_EMAIL="you@example.com" \
  --build-arg ARCH="arm64" \
  .
````

> 🔁 Set `ARCH` to:
>
> * `arm64` for Apple Silicon or ARM-based devices (default)
> * `amd64` for Intel/AMD machines


### 2. Run the Container

```bash
docker run -it --rm \
  -v "$(pwd)/developer-portal:/workspace/developer-portal" \
  dev-hugo \
  bash
```

> 🗂️ This mounts your local `./developer-portal` directory into the container at `/workspace/developer-portal`.


### 3. Inside the Container

Once inside, you're ready to:

* Run Python scripts
* Use Git (with preconfigured name/email)
* Run Hugo builds:

  ```bash
  hugo serve
  ```



## ⚙️ Build Args Summary

| Argument    | Description                           | Default Value       |
| ----------- | ------------------------------------- | ------------------- |
| `GIT_USER`  | Git username for commits              | `"Your Name"`       |
| `GIT_EMAIL` | Git email for commits                 | `"you@example.com"` |
| `ARCH`      | Architecture for Hugo binary download | `"arm64"`           |


## 🧪 Notes

* Hugo version used: `v0.125.7 (Extended)`
* No Snap used due to incompatibility with Docker
* You can safely modify this image to include Node.js, pipenv, or other tools as needed



## 📂 Project Structure

```
.
├── Dockerfile
├── README.md
└── developer-portal/    <-- Your local repo (mounted volume)
```


## 🙋 Questions

For help or improvements, feel free to open a discussion or issue in the main Developer Portal repo.


