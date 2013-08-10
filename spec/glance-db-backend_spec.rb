require_relative "spec_helper"

describe "openstack-docker::glance-db-backend" do
  before { docker_stubs }
  describe "ubuntu" do
    before do
      @chef_run = ::ChefSpec::ChefRunner.new(::UBUNTU_OPTS) do |n|
		n.set["openstack"]["docker"]["glance_db_backend"]["path"]  = "/glance_db"
		n.set["openstack"]["docker"]["glance_db_backend"]["files"] = ["glance.py"]
      end
      @chef_run.converge "openstack-docker::glance-db-backend"
    end

    describe "glance db path" do
      before do
        @dir = @chef_run.directory "/glance_db"
      end

      it "has proper owner" do
        expect(@dir).to be_owned_by "root", "root"
      end

      it "has proper modes" do
        expect(sprintf("%o", @dir.mode)).to eq "755"
      end
    end

    it "glance-db file file has proper modes" do
      file = @chef_run.cookbook_file "/glance_db/glance.py"
      expect(sprintf("%o", file.mode)).to eq "755"
    end

  end
end

