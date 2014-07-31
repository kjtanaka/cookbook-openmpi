#
# Cookbook Name:: openmpi
# Recipe:: default
# Author:: Koji Tanaka (<kj.tanaka@gmail.com>)
#
# Copyright 2014, FutureGrid, Indiana University
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'build-essential'

directory node['openmpi']['download_dir'] do
  owner "root"
  group "root"
  mode "0755"
  action :create
end

remote_file "#{node['openmpi']['download_dir']}/openmpi-#{node['openmpi']['version']}.tar.bz2" do
  source node['openmpi']['download_url']
  owner "root"
  group "root"
  mode "0755"
  action :create
end

execute "extract_tarball" do
  user "root"
  cwd node['openmpi']['download_dir']
  command "tar jxf openmpi-#{node['openmpi']['version']}.tar.bz2"
  creates "openmpi-#{node['openmpi']['version']}"
end

if node['openmpi']['support_torque']
  configure_option = "--prefix=/opt/openmpi-#{node['openmpi']['version']} --with-tm=#{node['openmpi']['torque_dir']}"
else
  configure_option = "--prefix=/opt/openmpi-#{node['openmpi']['version']}"
end

bash "install_openmpi" do
  user "root"
  cwd "/root/source/openmpi-#{node['openmpi']['version']}"
  code <<-EOH
  ./configure #{configure_option}
  make
  make install
  EOH
  creates "/opt/openmpi-#{node['openmpi']['version']}"
end
