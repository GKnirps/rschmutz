# rschmutz
Spill dirt on your text. Inspired by https://github.com/githubert/schmutz.

How to use:
```ruby
require 'rschmutz'
mangle "Text you want to mangle", $DIRT[1], 0.3
```
```
=> "T͓ex̵t͘ you wa͘nt͓ to͓ m̵angle"
```
The first parameter is the text you want to spill dirt on.
The second parameter is an array of unicode combining characters.
$DIRT contains three pre-defined levels of combining characters, where $DIRT[0] uses only small ones and $DIRT[2] uses stuff you don't really want to see.
The third parameter is the probability that a combining character is put after a character.

What is it good for? Nothing. If you like it, please tell it the author of the go program that inspired me.
