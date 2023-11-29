# AwWkhtmltopdf

## Installation

```console
$ gem install aw_wkhtmltopdf
```

## Usage

### command

We can use `aw_wkhtmltopdf` instead of `wkhtmltopdf` .

```console
$ aw_wkhtmltopdf --version
wkhtmltopdf 0.12.3 (with patched qt)
```

### binary path

We can get raw binary path from `AwWkhtmltopdf.path` .

```console
$ ruby -raw_wkhtmltopdf -e 'puts(AwWkhtmltopdf.path)'
/home/yuya/.anyenv/envs/rbenv/versions/3.2.2/lib/ruby/gems/3.2.0/gems/aw_wkhtmltopdf-0.12.3.0.0/libexec/wkhtmltopdf-x86_64_linux
```

### for PDFKit

PDFKit configuration sample is here:

```ruby
PDFKit.configure do |config|
  config.wkhtmltopdf = AwWkhtmltopdf.path.to_s
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/agileware-jp/aw_wkhtmltopdf .
