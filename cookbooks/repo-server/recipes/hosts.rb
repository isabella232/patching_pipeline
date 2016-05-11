#
# Cookbook Name:: repo-server
# Recipe:: hosts
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

template '/etc/hosts' do
    source 'hosts.erb'
    owner 'root'
    group 'root'
    mode '0644'
end
