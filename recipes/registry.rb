#
# Cookbook Name:: openstack-docker
# Recipe:: registry
#
# Copyright 2012-2013, Rackspace US, Inc.
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


include_recipe 'docker::default'

case node["openstack"]["docker"]["chef_repo"]
when "rcbops"
  keystone = get_settings_by_role("keystone-setup", "keystone")
  ks_internal_endpoint = get_access_endpoint("keystone-api", "keystone", "internal-api")
  glance_api = get_access_endpoint("glance-api", "glance","api")
  docker_image 'samalba/docker-registry'
  docker_container 'samalba/docker-registry' do
    command "./docker-registry/run.sh"
    env     [
              "SETTINGS_FLAVOR=openstack",
              "OS_USERNAME=#{keystone['admin_user']}",
              "OS_PASSWORD='#{keystone['users'][keystone['admin_user']]['password']}'",
              "OS_TENANT_NAME=#{keystone['users'][keystone['admin_user']]['default_tenant']}",
              "OS_GLANCE_URL='#{glance_api}'",
              "OS_AUTH_URL='#{ks_internal_endpoint}'"
            ]
    port    "5042:5000"
    detach  true
when "stackforge"
  ## Coming soon!
end
