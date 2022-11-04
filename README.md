# vfzf
[![](https://img.shields.io/github/license/sakkke/vfzf?style=for-the-badge)](https://github.com/sakkke/vfzf/blob/main/LICENSE)
[![](https://img.shields.io/badge/VPM-sakkke.vfzf-5D87BF?style=for-the-badge)](https://vpm.vlang.io/mod/sakkke.vfzf)

V wrapper for [fzf].
This is a V port of [pyfzf].

## Requirements

- V
- [fzf]

## Installation

```shell
v install sakkke.vfzf
```

## Usage

```v
import vfzf { new_fzf_prompt }
fzf := new_fzf_prompt()
```

If fzf is not available on PATH, you can specify a location:

```v
fzf := new_fzf_prompt(executable_path: '/path/to/fzf')
```

Simply pass a array of options to the prompt function to invoke fzf:

```v
fzf.prompt(choices: ['1', '2', '3'])
```

You can pass additional arguments to fzf as `fzf_options`:

```v
fzf.prompt(choices: ['1', '2', '3'], fzf_options: '--multi --cycle')
```

Input items are written to a temporary file which is then passed to fzf. The items are delimited with `\n` by default, you can also change the delimiter (useful for multiline items):

```v
fzf.prompt(choices: ['1', '2', '3'], fzf_options: '--read0', delimiter: '\0')
```

## License

MIT

## Thanks

- [@nk412](https://github.com/nk412) is the original author of [pyfzf].

[fzf]: https://github.com/junegunn/fzf
[pyfzf]: https://github.com/nk412/pyfzf
