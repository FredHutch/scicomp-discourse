#
# Cookbook Name:: scicomp-discourse
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

docker_installation_script 'default_docker' do
  repo 'main'
  action :create
end

directory '/var/discourse' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

bash 'clone_repo' do
  cwd '/var'
  code <<-EREH
    git clone https://github.com/discourse/discourse_docker.git /var/discourse
  EREH
  not_if { ::File.exist?('/var/discourse/discourse-setup') }
end

directory '/var/discourse/containers' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

template '/var/discourse/containers/app.yml' do
  source 'app.yml.erb'
  owner 'root'
  group 'root'
  mode '0644'
end
