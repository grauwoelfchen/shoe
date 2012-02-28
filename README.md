# shoe

This is a sample mock project.

* [S] sbsm
* [h] htmlgrid
* [o] odba
* [e] example

-----

## setup

sample apache.conf (see shoe.conf)

```
<VirtualHost *:80>
  DocumentRoot /var/www/shoe/doc
  ServerName shoe.localhost
  DirectoryIndex index.rbx
  RubyAddPath /var/www/shoe/src
  RubyAddPath /usr/local/lib/ruby/gems/1.9.1/gems/sbsm-1.1.4/lib
  RubyRequire 'sbsm/trans_handler'
  SetHandler ruby-object
  RubyTransHandler SBSM::FlavoredTransHandler.instance
  SetEnv DEFAULT_FLAVOR gcc 
</VirtualHost>
```
