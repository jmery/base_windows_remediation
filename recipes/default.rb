#
# Cookbook Name:: base_windows_remedation
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

# We are going to use the most recent DSC resources so we need WMF version 5
include_recipe 'powershell::powershell5'

powershell_script 'Install xWinEventLog Module' do
  code 'Install-Package -Name xWinEventLog -ForceBootstrap -Provider PowerShellGet -Force'
  not_if '(Get-Module xWinEventLog -List) -ne $null'
end

include_recipe 'base_windows_remedation::account'
include_recipe 'base_windows_remedation::audit'
include_recipe 'base_windows_remedation::base'
include_recipe 'base_windows_remedation::ie'
include_recipe 'base_windows_remedation::rdp'
