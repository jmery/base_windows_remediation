#
# Cookbook Name:: base_windows_remedation
# Recipe:: rdp
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

node['rdp']['rdpkeys'].each do |audit, key, value|
  dsc_resource "#{audit}" do
    resource :registry
    property :ensure, 'Present'
    property :key, 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services'
    property :valuename, "#{key}"
    property :valuedata, ["#{value}"]
    property :valuetype, 'Dword'
  end
end
=begin
dsc_resource 'windows-rdp-100' do
  resource :registry
  property :ensure, 'Present'
  property :key, 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services'
  property :valuename, 'fPromptForPassword'
  property :valuedata, ['1']
  property :valuetype, 'Dword'
end

dsc_resource 'windows-rdp-101' do
  resource :registry
  property :ensure, 'Present'
  property :key, 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services'
  property :valuename, 'MinEncryptionLevel'
  property :valuedata, ['3']
  property :valuetype, 'Dword'
end
=end
