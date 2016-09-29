# # encoding: utf-8

# Inspec test for recipe base_windows_remedation::ie

# The Inspec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec_reference.html

# encoding: utf-8
# copyright: 2015, Chef Software, Inc
# license: All rights reserved

title 'Windows IE Configuration'

rule 'windows-ie-101' do
  impact 1.0
  title 'IE 64-bit tab'
  describe registry_key('HKLM\Software\Policies\Microsoft\Internet Explorer\Main') do
    it { should exist }
    its('Isolation64Bit') { should eq 1 }
  end
end

rule 'windows-ie-102' do
  impact 1.0
  title 'Run antimalware programs against ActiveX controls'
  describe registry_key('HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3') do
    it { should exist }
    its('270C') { should eq 0 }
  end
end
