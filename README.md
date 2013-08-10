Description
===========

This cookbook installs the OpenStack Compute and Glance drivers for docker as part of the OpenStack reference deployment Chef for OpenStack.   This only works on Ubuntu right now due to docker requirements.

http://docker.io

Requirements
============

Chef 0.10.0 or higher required (for Chef environment use).

Cookbooks
---------

The following cookbooks are dependencies:

* openstack-image
* openstack-compute
* openstack-identity
* openstack-common
* openstack-network
* docker
* golang
* lxc
* modules

Usage
=====

nova-driver
----
- Installs the nova driver for docker

glance-db-backend
----
- Installs the glance db backend for docker

You'll also want to set the following in your environment to enable it :-

* openstack["compute"]["driver"] = "docker.DockerDriver"
* openstack["image"]["data_api"] = "glance.db.docker.api"


Attributes
==========

Openstack Docker attributes are in the attribute namespace ["openstack"]["docker"].   There should be little reason to change these.    

* `openstack["docker"]["nova_driver"]["path"]`
* `openstack["docker"]["nova_driver"]["files"]`
* `openstack["docker"]["nova_driver"]["rootwrap.d"]`
* `openstack["docker"]["glance_db_backend"]["path"]`
* `openstack["docker"]["glance_db_backend"]["files"]`


Testing
=====

This cookbook uses [bundler](http://gembundler.com/), [berkshelf](http://berkshelf.com/), and [strainer](https://github.com/customink/strainer) to isolate dependencies and run tests.

Tests are defined in Strainerfile.

To run tests:

*old method*
    $ bundle install # install gem dependencies 
    $ bundle exec berks install # install cookbook dependencies
    $ bundle exec strainer test # run tests

*new method*
    $ ./test [clean|run|bundle|berks|strainer]

License and Author
==================

|                      |                                                    |
|:---------------------|:---------------------------------------------------|
| **Author**           |  Justin Shepherd (<justin.shepherd@rackspace.com>) |
| **Author**           |  Jason Cannavale (<jason.cannavale@rackspace.com>) |
| **Author**           |  Ron Pedde (<ron.pedde@rackspace.com>)             |
| **Author**           |  Joseph Breu (<joseph.breu@rackspace.com>)         |
| **Author**           |  William Kelly (<william.kelly@rackspace.com>)     |
| **Author**           |  Darren Birkett (<darren.birkett@rackspace.co.uk>) |
| **Author**           |  Evan Callicoat (<evan.callicoat@rackspace.com>)   |
| **Author**           |  Matt Ray (<matt@opscode.com>)                     |
| **Author**           |  Jay Pipes (<jaypipes@att.com>)                    |
| **Author**           |  John Dewey (<jdewey@att.com>)                     |
| **Author**           |  Craig Tracey (<craigtracey@gmail.com>)            |
| **Author**           |  Sean Gallagher (<sean.gallagher@att.com>)         |
| **Author**           |  Ionut Artarisi (<iartarisi@suse.cz>)              |
| **Author**           |  Paul Czarkowski (<paul@paulcz.net>)               |
|                      |                                                    |
| **Copyright**        |  Copyright (c) 2012-2013, Rackspace US, Inc.       |
| **Copyright**        |  Copyright (c) 2012-2013, Opscode, Inc.            |
| **Copyright**        |  Copyright (c) 2012-2013, AT&T Services, Inc.      |
| **Copyright**        |  Copyright (c) 2013, Craig Tracey                  |
| **Copyright**        |  Copyright (c) 2013, SUSE Linux GmbH               |

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
