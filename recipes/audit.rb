#
# Cookbook Name:: base_windows_remedation
# Recipe:: audit
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

node['audit']['logs'].each do |audit, log|
  dsc_resource "#{audit}" do
    resource :xWinEventLog
    property :LogName, "#{log}"
    property :MaximumSizeInBytes, node['audit']['eventlogsize']
  end
end

execute 'windows-audit-201' do
  command 'auditpol /set /subcategory:"Kerberos Authentication Service" /success:enable /failure:enable'
  action :run
end

execute 'windows-audit-202' do
  command 'auditpol /set /subcategory:"Kerberos Service Ticket Operations" /success:enable /failure:enable'
  action :run
end

execute 'windows-audit-203' do
  command 'auditpol /set /subcategory:"Other Account Logon Events" /success:enable /failure:enable'
  action :run
end

execute 'windows-audit-204' do
  command 'auditpol /set /subcategory:"Application Group Management" /success:enable /failure:enable'
  action :run
end

execute 'windows-audit-205' do
  command 'auditpol /set /subcategory:"Computer Account Management" /success:enable /failure:enable'
  action :run
end

execute 'windows-audit-206' do
  command 'auditpol /set /subcategory:"Distribution Group Management" /success:enable /failure:enable'
  action :run
end