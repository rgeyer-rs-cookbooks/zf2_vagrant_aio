maintainer       "Ryan J. Geyer"
maintainer_email "me@ryangyeer.com"
license          "All rights reserved"
description      "Installs/Configures zf2_vagrant_aio"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.0"

depends "apache2"
depends "mysql"

attribute "zf2_vagrant_aio/db/schema",
  :display_name => "ZF2 Vagrant AIO DB Schema",
  :description => "The name of the DB schema expected by the ZF2 app",
  :required => "required"