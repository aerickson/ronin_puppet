# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

class roles_profiles::profiles::ntp {
  case $facts['os']['name'] {
    'Darwin': {
      class { 'macos_ntp':
        enabled    => true,
        ntp_server => lookup('ntp_server'),
      }
    }
    'Ubuntu': {
      case $facts['os']['release']['full'] {
        '18.04': {
          $ntp_server = lookup('ntp_server', String)
          class { 'ntp':
            servers => [$ntp_server],
          }
        }
        '22.04': {
          # https://ubuntu.com/server/docs/network-ntp
          # NOTE: timesyncd isn't as advanced as ntpd, see if we need to go to ntpd

          # edit /usr/lib/systemd/system/systemd-timesyncd.service
          #   remove "ConditionVirtualization=!container"
          file_line { 'modify systemd-timesyncd.service':
            path  => '/usr/lib/systemd/system/systemd-timesyncd.service',
            line  => 'ConditionVirtualization=',
            match => '^ConditionVirtualization.*$',
          }

          $ntp_server = lookup('ntp_server', String)
          class { 'systemd':
            manage_timesyncd => true,
            ntp_server       => [$ntp_server],
          }
        }
        default: {
          fail("Unrecognized Ubuntu version ${facts['os']['release']['full']}")
        }
      }
    }
    'Windows': {
      # https://bugzilla.mozilla.org/show_bug.cgi?id=1510754
      # For windowstime resoucre timezone and server needs to be set in the same class
      # Resource from ncorrare-windowstime
      if $facts['custom_win_location'] == 'datacenter' {
        $ntpserver = lookup('windows.datacenter.ntp')
      } else {
        $ntpserver = lookup('windows.external.ntp')
      }
      class { 'windowstime':
        servers  => { "${ntpserver}" => '0x08' },
        timezone => 'Greenwich Standard Time',
      }
    }
    default: {
      fail("${facts['os']['name']} not supported")
    }
  }
}
