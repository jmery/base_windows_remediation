# # encoding: utf-8

# Inspec test for recipe base_windows_remedation::rdp

# The Inspec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec_reference.html

# encoding: utf-8
# copyright: 2015, Chef Software, Inc
# license: All rights reserved

title 'Windows RDP Configuration'

rule 'windows-rdp-100' do
  impact 1.0
  title 'Windows Remote Desktop Configured to Always Prompt for Password'
  describe registry_key('HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services') do
    it { should exist }
    its('fPromptForPassword') { should eq 1 }
  end
end

rule 'windows-rdp-101' do
  impact 1.0
  title 'Strong Encryption for Windows Remote Desktop Required'
  describe registry_key('HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services') do
    it { should exist }
    its('MinEncryptionLevel') { should eq 3 }
  end
end
