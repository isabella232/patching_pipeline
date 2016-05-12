#
# Cookbook Name:: repo-server
# Recipe:: promote-packages
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

search("centos_patchlist", "*:*").each do |patch|

  env_id = patch["id"].split(/-/)[0]
  Chef::Log.info "Environment ID: #{env_id}"
  if env_id == "ENVIRONMENT"
    return
  end
    
  package_set = patch["package"]
  log "package_set=#{package_set}"
  
  repo_dir = File.join("/storage/repos", env_id)
  
  if !package_set.nil?
    package_set.each do |package|
      srcfile = File.join("/storage/repos/updates", "#{package}.rpm")
      dstfile = File.join(repo_dir, "#{package}.x86_64.rpm")
      log "srcfile=#{srcfile}"
      log "dstfile=#{dstfile}"

      remote_file "#{dstfile}" do
        source "file://#{srcfile}}"
        action :create
      end
    end

    Chef::Log.info "Creating repo #{repo_dir}"
    execute 'create yum repo' do
      action :run
      command "createrepo '#{repo_dir}'"
    end
  end
end