#
# Cookbook Name:: openstack-docker
# Recipe:: nova-driver
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

class ::Chef::Recipe
  include ::Openstack
end

# lets be lazy
nova_driver_path  = node["openstack"]["docker"]["nova_driver"]["path"]
nova_driver_files = node["openstack"]["docker"]["nova_driver"]["files"]

directory nova_driver_path do
  # Must be root!
  owner "root"
  group "root"
  mode  00755

  action :create
end

nova_driver_files.each do |file|
  cookbook_file "#{nova_driver_path}/#{file}" do
    source "nova-driver/#{file}"
    mode   00755

    action :create
  end
end

cookbook_file "/etc/nova/rootwrap.d/docker.filters" do
  source "nova-driver/docker.filters"
  mode   00700

  action :create
end