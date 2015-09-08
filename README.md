# Escaper

A quick and easy plugin to escape html entities in Vim.  It's smart enough to
not replace previously escaped entities.


## Installation

It's recommended you use Pathogen, Vundle or NeoBundle.  Otherwise copy the
respective files into their respective `.vim` sub folders.


## How To Use

There are 2 APIs. Both can be called by themselves (to replace the entire
file), with a range, or a visual selection.


### `:Escape`

This command is safe for use in html files. It will not escape `<`, `>`, `'`
and `"` characters.


### `:EscapeAll`

This command will replace ALL entities.


### Ignore Arguments

If there are specific entities you'd like to ignore simply add them as
arguments to your function calls.  Each argument should be separated by a
space.  These arguments can be passed into both commands above.

For example, this command would replace all entities except `>` and `"`:

```
:EscapeAll > "
```


### Custom Replacements

You can also provide custom replacements list if you'd like.  Since these are
called first, it enables the default replacements to be overridden.

Simply provide a global list of replacements like so:

```
let g:CustomEntities = [
  \ ["£", "\&pound;"],
  \ ["¤", "\&curren;"]
\ ]
```

**Note:** Ensure you escape the `&` with a `\` as seen above.


## License

[The MIT License (MIT)](http://opensource.org/licenses/MIT)

Copyright &copy; 2014 Amadeus Demarzi
