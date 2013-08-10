name             "openstack-docker"
maintainer       "Paul Czarkowski"
maintainer_email "paul@paulcz.net"
license          "Apache 2.0"
description      "The OpenStack Compute and Image drivers for docker"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "7.0.0"

recipe "openstack-docker::nova-driver", "Installs docker drivers for Compute"
recipe "openstack-docker::glance-db-backend", "Installs docker drivers Image"

%w{ ubuntu }.each do |os|
  supports os
end

depends "openstack-compute", "~> 7.0.0"
depends "openstack-image",   "~> 7.0.0"
depends "openstack-common",  "~> 0.4.0"
depends "docker"
depends "golang"
depends "lxc"
depends "modules"