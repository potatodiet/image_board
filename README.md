Image Board
----------
Just a typical danbooru-style image board.

Production Requirements
----------
* PostgreSQL
* ImageMagick
* Ruby (1.9.3)
* Node.js (Linux only)

Development Requirements
----------
* Vagrant
* VirtualBox

Development Setup
----------
```
cd vagrant/
vagrant up
vagrant ssh

cd /home/vagrant/code/image_board/
rails server
```

TODO
----------
* Comment posting and pagination with AJAX
