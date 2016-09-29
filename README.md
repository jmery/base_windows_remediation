# Overview

This proof of concept cookbook remedates a version of the 'base/windows' compliance profile that ships with Chef Automate.  The audit tests in this cookbook have been modified to work on Windows 2012 R2 systems that are NOT part of a Windows domain.  These audits point to the various locations managed by the Local Security Policy as opposed to those used when policy is enforced by AD GPO.

# Notes

This cookbook requires WMF 5.0 as we use `dsc_resource` to remediate as much as possible.  You will need to `kitchen converge` twice if WMF 5.0 is not installed.  The first converge will install WMF 5.0 and reboot as required.  The second will continue and remediate all issues.

Version 5.0.0 of the `powershell` cookbook is currently broken with respect to the `reboot` funtion.  It is still calling the `windows::reboot_handler` which has been deprecated.  There is a patch merged to master on `powershell`, but it has not yet been released to the Supermarket.  As a work-around, manually pull down the `powershell` cookbook and use the Berksfile to point kitchen at the proper location.  The next release of the `powershell` cookbook will remove this hack. 

