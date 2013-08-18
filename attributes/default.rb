
default["openstack"]["docker"]["source"] = "git"
default["openstack"]["docker"]["path"] = "/opt/docker"
default["openstack"]["docker"]["git"]["repository"] = "https://github.com/dotcloud/openstack-docker.git"
default["openstack"]["docker"]["git"]["revision"] = "8c4678b8ba2664e65b5f5135451a771c8e5a4726"
default["openstack"]["docker"]["nova_driver"]["path"]       = "/usr/lib/python2.7/dist-packages/nova/virt/docker"

# only matters if using the previous method of having the files in the repo.
default["openstack"]["docker"]["nova_driver"]["files"]      = ["client.py","driver.py","hostinfo.py","__init__.py"]
default["openstack"]["docker"]["nova_driver"]["rootwrap.d"] = "docker.filters"
default["openstack"]["docker"]["glance_db_backend"]["path"]  = "/usr/lib/python2.7/dist-packages/glance/db/docker"
default["openstack"]["docker"]["glance_db_backend"]["files"] = ["api.py", "__init__.py"]


