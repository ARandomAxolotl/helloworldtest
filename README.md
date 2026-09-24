# helloworldtest

> a too overengineered test for `Hello, World!` program

## Dependencies

- bash

- modern GNU/Linux-ish setup

## Usage

- ./helloworldtest "command 1" [program 2] [files]

Example : `./helloworldtest run/* "node src/test.js"`

## CLI flags : 

- `-f` or `--file` : import a file containing list of programs

Usage : `-f|--file [file]`

- `-r` or `--runtime` : set/increase/decrease maximum aceptable runtime to/by [value]

Usage : `-r|--runtime (+|-)[value]`

> Counted in seconds

- `-t` or `--timeout` : set/increase/decrease timeout runtime to/by [value]

Usage : `-t|--timeout (+|-)[value]`

> Counted in seconds

- `-h` or `--help` : show help

Usage : `-h|--help`

- `-d` or `--directory` : test all file in [directory]

Usage : `-d|--directory [directory]`

- `-e` or `--exclude` : exclude all files with [pattern]

Usage : `-e|--exclude [pattern]`

> Note : pattern is just bash pattern as I'm to lazy to invent regex in bash

## `-t|--timeout|-r|--runtime` +|- rule : 

- [value] : set [value]
- +[value] : add [value]
- -[value] : minus [value]

<!-- Hidden flags -->

<!-- `--is-mizuki-tuff` -->

<!-- `--is-Mizuki-tuff` -->

<sup><sub> Please dont be genderism Mizuki is very tuff </sub></sup>
