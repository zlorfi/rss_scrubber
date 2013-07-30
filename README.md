# Caching
- don't use the file system as storage in production since there is no method for purging the ./tmp directory

# Adding news ans comics
- it's all based on DOM-elements

# TODO's
This app is not 100% bulletproof

# Gotchas
nokogiri won't work on MacOS 10.8.2

`brew install libxml2 libxslt`

`brew install libiconv`

`sudo gem install nokogiri -- --with-xslt-dir=/usr/local/opt/libxslt`
