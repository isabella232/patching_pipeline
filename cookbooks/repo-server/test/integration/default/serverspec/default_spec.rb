require 'spec_helper'

describe 'repo-server::default' do
  # Serverspec examples can be found at
  # http://serverspec.org/resource_types.html
  
  # Make sure our packages are installed...
  describe package 'httpd' do
    it { should be_installed }
  end
  
  describe package 'createrepo' do
    it { should be_installed }
  end

  # Confirm our repo directories were created successfully...
  describe file ('/storage/repos') do
    it { should be_directory }
  end

  # Confirm Apache is up and listening...  
  describe port(80) do
    it { should be_listening }
  end
  
  describe command('curl http://localhost/repos/') do
    its(:stdout) { should match /Index of \/repos/ }
  end
  
end
