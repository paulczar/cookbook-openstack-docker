require "chefspec"
#require "berkshelf"

#berksfile = Berkshelf::Berksfile.from_file('Berksfile')
#berksfile.install(path: '.test/berkshelf')

::LOG_LEVEL = :fatal
::OPENSUSE_OPTS = {
  :platform  => "opensuse",
  :version   => "12.3",
  :log_level => ::LOG_LEVEL
}
::REDHAT_OPTS = {
  :platform  => "redhat",
  :version   => "6.3",
  :log_level => ::LOG_LEVEL
}
::UBUNTU_OPTS = {
  :platform  => "ubuntu",
  :version   => "12.04",
  :log_level => ::LOG_LEVEL
}

def docker_stubs
end


def expect_runs_docker_default_recipe
  it "installs default" do
    expect(@chef_run).to include_recipe "openstack-docker::default"
  end
end
