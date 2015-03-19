# coloring-sh
Coloring a particular string to tail command.

## Usage

    coloring.sh [-k keyword][-h]
    
        -k <arg> : Keyword for coloring
        -h       : Get help

            See the other command manual

## How to use in other commands

- ex) cat command

    alias cat="COLORING_CMD=cat sh coloring.sh"
