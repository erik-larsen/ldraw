# LDraw parts library

A copy of the [LDraw parts library](https://library.ldraw.org), published at [erik-larsen.github.io/ldraw/](https://erik-larsen.github.io/ldraw/) so web pages can fetch parts from it one file at a time. [KineBrick](https://erik-larsen.github.io/kinebrick/) fetches the parts of a model you open yourself from here.

It holds the official library as `complete.zip` has it: `parts/` (with `parts/s/`, subparts), `p/` (primitives, with `p/48/` and `p/8/`), and `LDConfig.ldr` (the colours). A part is at `https://erik-larsen.github.io/ldraw/parts/3001.dat`, a primitive at `https://erik-larsen.github.io/ldraw/p/stud.dat`.

## Updating

LDraw.org releases library updates a few times a year. To bring this copy up to date:

1. Run `./update.sh`. It downloads the latest `complete.zip` (about 150 MB) and replaces `parts/`, `p/` and the files beside them.
2. Check what changed with `git status`, then commit and push. GitHub Pages publishes it within a few minutes.

## License

The LDraw parts library is by the LDraw.org community, licensed under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/) (older files under CCAL 2.0): see `CAreadme.txt` and `CAlicense4.txt`. This is an unchanged copy. Every file is named in small letters, as the official release already is; `update.sh` makes sure of it, because models name files in any case, KineBrick asks for every file in small letters, and the web server only finds a file whose name matches exactly.
