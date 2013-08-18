#
# Cookbook Name:: openstack-docker
# Recipe:: git
#
# Copyright 2012, Opscode, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

git node["openstack"]["docker"]["path"] do
  repository node["openstack"]["docker"]["git"]["repository"]
  reference  node["openstack"]["docker"]["git"]["revision"]
  action :sync
end

execute "symlink_nova_driver" do
  command "/bin/ln -s #{node["openstack"]["docker"]["path"]}/nova-driver #{node["openstack"]["docker"]["nova_driver"]["path"]}"
  action :run
end


link "/etc/nova/rootwrap.d/docker.filters" do
  to "#{node["openstack"]["docker"]["path"]}/nova-driver/docker.filters"
  owner "root"
  group "root"
end

group "docker" do
  members "nova"
  append true
  action :create
end

# make sure docker socket is writable
file "/var/run/docker.sock" do
  mode "0777"
  action :touch
end
