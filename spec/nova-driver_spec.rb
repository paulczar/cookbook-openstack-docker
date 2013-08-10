require_relative "spec_helper"

describe "openstack-docker::nova-driver" do
  before { docker_stubs }
  describe "ubuntu" do
    before do
      @chef_run = ::ChefSpec::ChefRunner.new(::UBUNTU_OPTS) do |n|
		n.set["openstack"]["docker"]["nova_driver"]["path"]        = "/nova_path"
		n.set["openstack"]["docker"]["nova_driver"]["files"]       = ["nova.py"]
		n.set["openstack"]["docker"]["nova_driver"]["rootwrap.d"]  = "docker.filters"
      end
      @chef_run.converge "openstack-docker::nova-driver"
    end

    describe "nova driver path" do
      before do
        @dir = @chef_run.directory "/nova_path"
      end

      it "has proper owner" do
        expect(@dir).to be_owned_by "root", "root"
      end

      it "has proper modes" do
        expect(sprintf("%o", @dir.mode)).to eq "755"
      end
    end

    it "nova driver file has proper modes" do
      file = @chef_run.cookbook_file "/nova_path/nova.py"
      expect(sprintf("%o", file.mode)).to eq "755"
    end

    it "docker.filters has proper modes" do
      file = @chef_run.cookbook_file "/etc/nova/rootwrap.d/docker.filters"
      expect(sprintf("%o", file.mode)).to eq "700"
    end

  end
end

