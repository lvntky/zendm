
![Logo](./docs/zendm_logo.png)


[![MIT License](https://img.shields.io/badge/License-MIT-green.svg)](https://choosealicense.com/licenses/mit/)
# zendm

**zendm** is a lightweight, custom display manager for Linux built using `ncurses`. It aims to provide a simple and efficient way to manage user sessions from the terminal, with a focus on minimalism and configurability.

## Features

- **Terminal-based UI**: Uses `ncurses` for a text-based interface that is responsive and minimal.
- **Customizability**: Easily configurable to suit your specific needs.
- **Lightweight**: Designed to be fast and efficient, with minimal dependencies.
- **Multi-user support**: Manage multiple user sessions with ease.
- **Secure**: Prioritizes security with careful management of user credentials and sessions.


## Installation

### Prerequisites

Before installing zendm, make sure you have the following dependencies:

- **gcc**: The GNU Compiler Collection.
- **ncurses**: A library for creating text-based user interfaces.

On a Debian-based system, you can install these with:

```bash
sudo apt-get update
sudo apt-get install gcc libncurses5-dev libncursesw5-dev
```

### Building From The Source
To build zendm from source, follow these steps:
1. Clone the repository :
```bash
git clone https://github.com/lvntky/zendm.git
cd zendm
```
2. Compile the source code :
```bash
make
```
3. Install zendm :
```bash
sudo make install
```
This will compile the code and install the binary to /usr/local/bin.
## Usage/Examples

```javascript
run as a systemd service / UNIX daemon
```


## Contributing

Contributions are always welcome!

See `contributing.md` for ways to get started.

Please adhere to this project's `code of conduct`.


## Acknowledgements

 - [ly](https://github.com/fairyglade/ly)
 - [How to write a display manager](https://gsgx.me/posts/how-to-write-a-display-manager/)


## Authors

- [@lvntky](https://www.github.com/lvntky)


## License

[MIT](https://choosealicense.com/licenses/mit/)

