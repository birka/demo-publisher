#
# Cookbook Name:: demo_rabbitmq
# Recipe:: default
#
# Copyright (C) 2016 birk
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

node.default['rabbitmq']['use_distro_version'] = true
include_recipe 'rabbitmq::default'

include_recipe 'rabbitmq::mgmt_console'

node.default['rabbitmq']['virtualhosts'] = ['/demo']
include_recipe 'rabbitmq::virtualhost_management'

rabbitmq_user 'demo' do
  password 'demo'
  action :add
end

rabbitmq_user 'demo' do
  vhost '/demo'
  permissions '.* .* .*'
  action :set_permissions
end

rabbitmq_user 'demo' do
  tag 'management'
  action :set_tags
end
