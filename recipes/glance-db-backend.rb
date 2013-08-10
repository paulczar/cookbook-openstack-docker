#
# Cookbook Name:: openstack-docker
# Recipe:: glance-db-backend
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
glance_db_backend_path  = node["openstack"]["docker"]["glance_db_backend"]["path"]
glance_db_backend_files = node["openstack"]["docker"]["glance_db_backend"]["files"]

directory glance_db_backend_path do
  # Must be root!
  owner "root"
  group "root"
  mode  00755

  action :create
end

glance_db_backend_files.each do |file|
  cookbook_file "#{glance_db_backend_path}/#{file}" do
    source "glance-db-backend/#{file}"
    mode   00755

    action :create
  end
end