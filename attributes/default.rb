default["openstack"]["docker"]["nova_driver"]["path"]       = "/usr/lib/python2.7/dist-packages/nova/virt/docker"
default["openstack"]["docker"]["nova_driver"]["files"]      = ["client.py","driver.py","hostinfo.py","__init__.py"]
default["openstack"]["docker"]["nova_driver"]["rootwrap.d"] = "docker.filters"

default["openstack"]["docker"]["glance_db_backend"]["path"]  = "/usr/lib/python2.7/dist-packages/glance/db/docker"
default["openstack"]["docker"]["glance_db_backend"]["files"] = ["api.py", "__init__.py"]


