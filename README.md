# colorful.cr

[![License](https://img.shields.io/badge/license-MIT-green.svg)](https://github.com/icyleaf/colorful.cr/blob/master/LICENSE)
[![Version](https://img.shields.io/badge/version-0.1.0-green.svg)](https://github.com/icyleaf/colorful.cr)
[![Dependency Status](https://shards.rocks/badge/github/icyleaf/colorful.cr/status.svg)](https://shards.rocks/github/icyleaf/colorful.cr)
[![devDependency Status](https://shards.rocks/badge/github/icyleaf/colorful.cr/dev_status.svg)](https://shards.rocks/github/icyleaf/colorful.cr)
[![Build Status](https://travis-ci.org/icyleaf/colorful.cr.svg)](https://travis-ci.org/icyleaf/colorful.cr)

Colors in your terminal writes with Crystal Language, inspired from [colored](https://github.com/defunkt/colored).

Build in crystal version >= v0.20.1 (2016-12-05), Docs Generated in latest commit.

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  colorful.cr:
    github: icyleaf/colorful.cr
```

## Usage

```crystal
require "colorful"

# color examples
puts "green".green
puts "on_blue".on_blue
puts "black_on_white".black_on_white # same as black.on_white
puts "yellow_with_bold".yellow_with_bold # same as yellow.bold
puts "on_magenta_with_italic".on_magenta_with_italic # same as on_magenta.italic
puts "red_on_cyan_with_italic".red_on_cyan_with_italic # same as red.on_cyan.italic

puts "bule_on_white_with_underline".colorful({ "background" => "blue", "foreground" => "white", "mode" => "underline" })

# dump colors & modes
puts Colorful.colors
puts Colorful.modes
```

## Contributing

1. Fork it ( https://github.com/icyleaf/colorful.cr/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [[icyleaf]](https://github.com/icyleaf) icyleaf - creator, maintainer
