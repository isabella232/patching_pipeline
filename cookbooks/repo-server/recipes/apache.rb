#
# Cookbook Name:: repo-server
# Recipe:: apache
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

package 'httpd'
package 'httpd-tools'

template '/etc/httpd/conf.d/repodir.conf' do
    source 'repodir.conf.erb'
    owner 'root'
    group 'root'
    mode '0644'
end

directory '/storage' do
    owner 'root'
    group 'root'
    mode '0755'
end

service 'httpd' do
    action [ :enable, :start ]
end