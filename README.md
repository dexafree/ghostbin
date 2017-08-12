# dexafree/ghostbin Dockerfile

This is a repository I've created in order to have a Docker image for running [Ghostbin](https://ghostbin.com) in a private server.

It allows you to run it in your own computer, internally in your company, or host it in a public server.

The [Ghostbin project](https://github.com/DHowett/spectre) is also Open Source, but due to its dificulty in the setup, I thought that creating a Dockerfile and a docker image would be helpful for people like me who want to host it theirselves.

## Base image

The base image used for this Dockerfile is `golang:1.8.3-alpine3.6`:

* Golang as Ghostbin is written in Go, an thus is needed to compile it.
* Alpine as it provides a smaller base image, and therefore the resulting image will also be smaller.

## Limitations

In order for expiration, encryption and syntax highlighting to work, you need to be using Docker in a Linux system.

This is due to a difference in the internal Filesystem Docker for Linux uses: The FS driver used on Docker for macOS and Docker for Windows does not support the use of `xattrs` (extended attributes: saving metadata for a file in the filesystem), and Ghostbin relies on those attributes for saving the paste properties, such as the language, the encryption password and the expiration (if any of those is set).

So, you will need to run it on a host using Docker for Linux in order for them to work.

## Notes

As the [master branch of the Ghostbin project](https://github.com/DHowett/spectre/commit/90de2d7c989a603cf494eae3d31ec88420ebe750) (link to the latest master commit at the time of writing this readme) is not stable right now (it has mixed namespaces and is in the middle of a refactor), this Dockerfile uses the latest commit in the `v1-stable` branch, so it will probably not be running the exact same Ghostbin version the production server is running.

I spoke to the author and he told me he is working in making it stable, so in the future this image should adapt to the latest version.
