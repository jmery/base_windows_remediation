default['powershell']['installation_reboot_mode'] = 'immediate_reboot'

default['account']['minimumpasswordlength'] = '8'
default['account']['lockoutbadcount'] = '5'
default['account']['rdp_admins'] = '*S-1-5-32-544'

default['audit']['logs'] = { 'windows-audit-100' => 'Application',
                             'windows-audit-101' => 'Security',
                             'windows-audit-102' => 'Setup',
                             'windows-audit-103' => 'System'
                           }
default['audit']['eventlogsize'] = 134_217_728

default['base']['lmcompatibilitylevel'] = '4'
default['base']['ntlmminsec'] = '537395200'
default['base']['minseckeys'] = { 'windows-base-202' => 'NtlmMinClientSec',
                                  'windows-base-203' => 'NtlmMinServerSec'
                                }

default['rdp']['rdpkeys'] = [ [ 'windows-rdp-100', 'fPromptForPassword', '1' ],
                              [ 'windows-rdp-101', 'MinEncryptionLevel', '3' ]
                            ]