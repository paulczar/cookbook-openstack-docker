require_relative "spec_helper"

describe "openstack-docker::git" do
  before { docker_stubs }
  describe "ubuntu" do
    before do
      @chef_run = ::ChefSpec::ChefRunner.new(::UBUNTU_OPTS) do |n|
        n.set["openstack"]["docker"]["path"]                 = "/opt/docker"
        n.set["openstack"]["docker"]["nova_driver"]["path"]  = "/nova_driver"
        n.set["openstack"]["docker"]["git"]["repository"]    = "https://github.com/dotcloud/openstack-docker.git"
        n.set["openstack"]["docker"]["git"]["revision"]      = "8c4678b8ba2664e65b5f5135451a771c8e5a4726"
      end
      @chef_run.converge "openstack-docker::git"
    end

    it "git syncs openstack-docker" do
      # Todo
    end

    it "symlinks /opt/docker/docker.filters" do
      link = @chef_run.link "/nova_driver/docker.filters"
      expect(link).to link_to "/etc/nova/rootwrap.d/docker.filters"
    end

  end  
end

