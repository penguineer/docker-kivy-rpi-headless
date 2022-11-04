# docker-kivy-rpi-headless

> Docker base-image for headless [Kivy](https://kivy.org/) applications on a [Raspberry Pi](https://www.raspberrypi.org/)

To run Kivy applications without an X server on the Raspberry Pi, the SDL libraries need to be re-compiled.

This image contains the necessary dependencies and matching SDL libraries to run a Kivy app without a graphics environment (headless).


## How to Use

### Dockerfile

This image is indended to be used as a base-image for Kivy applications:

```
FROM: mrtux/kivy-rpi-headless:2.1-bullseye
```

### Requirements

The requirements [Cython](https://cython.org/) and [Kivy](https://kivy.org/) are already satisfied by this container.
Especially Kivy has been compiled with regard the SDL libraries, so it should not be overwritten.

The following requirements are safe and will match the installation in the container:
```
Cython==0.29.32
Kivy==2.1.0
```

To be a bit more flexible, the patch version can be omitted:
```
Cython~=0.29
Kivy~=2.1
```

## Maintainers

* Stefan Haun ([@penguineer](https://github.com/penguineer))


## Contributing

PRs are welcome!

If possible, please stick to the following guidelines:

* Keep PRs reasonably small and their scope limited to a feature or module within the code.
* If a large change is planned, it is best to open a feature request issue first, then link subsequent PRs to this
  issue, so that the PRs move the code towards the intended feature.


## License

MIT © 2022 Stefan Haun and contributors
