#
# Cookbook Name:: base_windows_remedation
# Recipe:: base
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
dsc_resource 'windows-base-103' do
  resource :registry
  property :ensure, 'Present'
  property :key, 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters'
  property :valuename, 'NullSessionShares'
  property :valuedata, ['']
  property :valuetype, 'MultiString'
end

dsc_resource 'windows-base-201' do
  resource :registry
  property :ensure, 'Present'
  property :key, 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa'
  property :valuename, 'LmCompatibilityLevel'
  property :valuedata, [node['base']['lmcompatibilitylevel']]
  property :valuetype, 'Dword'
end

node['base']['minseckeys'].each do |audit, key|
  dsc_resource "#{audit}" do
    resource :registry
    property :ensure, 'Present'
    property :key, 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\MSV1_0'
    property :valuename, "#{key}"
    property :valuedata, [node['base']['ntlmminsec']]
    property :valuetype, 'Dword'
  end
end
