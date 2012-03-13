# Shoe

This is a sample mock project.

* [S] sbsm
* [h] htmlgrid
* [o] odba
* [e] example

Let's learn world of oddb.org.

-----

## Setup

### Server - Apache

* Apach2
* mod\_ruby

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

-----

## Admin Tool

$ bin/admin

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
-> {1=>#<ODBA::Stub:82508740#1 @odba_class=SHOE::Article @odba_container=82494650#1>}
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


-----

## Flavor

sample flavors

* plain (http://shoe.localhost/de/plain/)
* grid (http://shoe.localhost/de/grid/)


-----

## Note

Before you run bin/shoed, please check druby port.  
If you use same port in multi process, unexpected error (Internal Server Error of Apache) caused.

See following files

* doc/index.rbx
* src/util/shoeapp.rb
