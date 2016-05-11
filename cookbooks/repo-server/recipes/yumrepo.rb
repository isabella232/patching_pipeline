#
# Cookbook Name:: repo-server
# Recipe:: yumrepo.rb
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

package 'createrepo'

%w[ /storage
    /storage/repos
	/storage/repos/acceptance
   	/storage/repos/union
    /storage/repos/rehearsal
	/storage/repos/delivered ].each do |path|
    directory path do
        owner 'root'
        group 'root'
        mode '0755'
    end
end

template '/storage/repos/createallrepos.sh' do
    source 'createallrepos.sh.erb'
    owner 'root'
    group 'root'
    mode '0744'
end
