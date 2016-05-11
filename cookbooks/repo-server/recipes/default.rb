#
# Cookbook Name:: repo-server
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'repo-server::hosts'
include_recipe 'repo-server::yumrepo'
include_recipe 'repo-server::apache'