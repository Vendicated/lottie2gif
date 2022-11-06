# Apng2Gif

Script to convert apngs to gif because everything else is kinda ughhh to use

Just a wrapper script around Samsung's rlottie and LFE

Based on https://wf.lavatech.top/aves-tech-notes/the-nightmare-that-is-lottie-to-gif-conversion, thanks so much Ave!

## Usage

You need cmake, make, g++, ffmpeg, imagemagick

### One time setup

```sh
git clone --recurse-submodules -j8 https://github.com/Vendicated/apng2gif
cd apng2gif

# Installs rlottie to /usr/local for simplicity, so sudo password is prompted
./build.sh
```

### Conversion

```sh
./convert.sh lottie.json 160x160
```
