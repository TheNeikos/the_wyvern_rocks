README
======

Setup
-----

Required software:

1. git
2. ruby ~> 2.2
3. bundler

To setup this webapp you first have to clone it, install the necessary software
and generate the database.

```bash
    git clone https://github.com/TheNeikos/the_wyvern_rocks
    bundler install
    rake db:create db:schema:load
```
