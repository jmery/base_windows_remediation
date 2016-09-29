#
# Cookbook Name:: base_windows_remedation
# Recipe:: ie
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
dsc_resource 'windows-ie-101' do
  resource :registry
  property :ensure, 'Present'
  property :key, 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Internet Explorer\Main'
  property :valuename, 'Isolation64Bit'
  property :valuedata, ['1']
  property :valuetype, 'Dword'
end

dsc_resource 'windows-ie-102' do
  resource :registry
  property :ensure, 'Present'
  property :key, 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3'
  property :valuename, '270C'
  property :valuedata, ['0']
  property :valuetype, 'Dword'
end
