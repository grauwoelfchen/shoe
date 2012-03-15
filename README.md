# Shoe

* https://github.com/grauwoelfchen/shoe

This is a sample mock project.

* [S] sbsm
* [h] htmlgrid
* [o] odba
* [e] example

Let's learn world of oddb.org.


## Setup

### Server - Apache

* Apache2 - http://www.apache.org
* mod\_ruby - https://github.com/shugo/mod\_ruby.git

sample httpd.conf (see shoe.conf)

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

### DB - PostgreSQL

sample db setup (see shoe.sql)

```
$ sudo -u postgres createdb -E UTF8 -T template0 shoe
$ sudo -u postgres createuser shoe
* To import the existing data do:
$ sudo -u postgres psql -f shoe.sql shoe
```


## Admin Tool

$ bin/admin

if result is small, return value of inspect

```
shoe;) articles
-> {}
shoe;) create_article
-> #<SHOE::Article:0x8a54cb0>
shoe;) articles
-> {1=>#<SHOE::Article:0x8a54cb0 @revision=2012-03-10 18:43:58 +0100, @odba_id=1, @id=1>} 
shoe;) articles.odba_store
-> Hash
shoe;) articles.values.first
-> #<SHOE::Article:0x8a54cb0>
shoe;) exit
-> Tschüs
```

\# reboot shoed  
$ bin/admin 

```
shoe;) articles
-> Hash
shoe;) articles.keys
-> [1]
shoe;) articles.values
-> [#<ODBA::Stub:82508740#1 @odba_class=SHOE::Article @odba_container=82494650#1>]
shoe;) articles.values.first
-> #<SHOE::Article:0x8a54cb0>
shoe;) articles.values.first.is_a? ODBA::Stub
-> true
shoe;) exit
-> Tschüs
```

* > articles  #=> all articles
* > recent_articles #=> recent 3 articles
* > create_article #=> create new article
* > delete_article(id) #=> delete article with id(odba_id)

  
## Access Test

1. Create test data

  ```
  $ test/data_loader.rb
  length?
  300
  preparing ...
  start data loading
  total: 300
  ```

2. Create request
  This batch.sh script just run test/access_test.rb.  
  Please run sometimes at the need.

3. Check status file
  Please check status file. There 2 ways.
  
  * http://shoe.localhost/resources/downloads/status
  * run test/status.sh (it downloads status output to test/log)

  
## Flavor

sample flavors

* plain (http://shoe.localhost/de/plain/)
* grid (http://shoe.localhost/de/grid/)


## Note

Before you run bin/shoed, please check your druby port. 
If you use the same port for multiple processes, unexpected errors may happen (i.e. Internal Server Error of Apache).

See following the files

* doc/index.rbx
* src/util/shoeapp.rb
