#
# Copyright:: Copyright (c) 2015 Chef Software, Inc.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# This recipe is intentionally left blank

data_bag_path = File.join(node['delivery']['workspace']['repo'], node['delivery']['config']['delivery-bag']['data-bag-repo-path'])
Dir.chdir(data_bag_path)
data_bag_list = Dir.glob("*").select {|f| File.directory? f}

# For each data bag in the repository test creating the data bag and items within
data_bag_list.each do |databag|
  # Get list of data bag items
  data_bag_item_list = Dir.glob("#{databag}/*.json")

  data_bag_item_list.each do |item|
    execute 'Running lint checks on data bag items' do
      command "jsonlint #{item}"
      action :run
    end
  end
end
