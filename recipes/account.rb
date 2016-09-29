#
# Cookbook Name:: base_windows_remedation
# Recipe:: account
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

template 'C:\Windows\Temp\security_policy.inf' do
  source 'security_policy.inf.erb'
  action :create
end

execute 'windows-100-103-104' do
  command 'secedit /configure /db C:\windows\temp\corp_policy.sdb /cfg C:\windows\temp\security_policy.inf /overwrite /quiet'
  action :run
end
