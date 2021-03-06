# Reference
<!-- DO NOT EDIT: This document was generated by Puppet Strings -->

## Table of Contents

**Classes**

* [`timezone`](#timezone): Configures the system timezone.

## Classes

### timezone

Configures the system timezone.

#### Examples

##### Configures the system for timezone UTC with RTC on UTC time.

```puppet
class { 'timezone':
  timezone   => 'UTC',
  rtc_is_utc => true,
}
```

##### Previous example but configured with data provided by hiera.

```puppet
timezone::timezone:   'UTC'
timezone::rtc_is_utc: true

include timezone
```

##### Configures the system for timezone Europe/Stockholm with RTC on UTC time.

```puppet
class { 'timezone':
  timezone   => 'Europe/Stockholm',
  rtc_is_utc => true,
}
```

##### Previous example but configured with data provided by hiera.

```puppet
timezone::timezone:   'Europe/Stockholm'
timezone::rtc_is_utc: true

include timezone
```

#### Parameters

The following parameters are available in the `timezone` class.

##### `timezone`

Data type: `Timezone::Timezone`

Name of the timezone to configure.

##### `rtc_is_utc`

Data type: `Boolean`

Whether the RTC is on UTC time or local time.

##### `package`

Data type: `String`

Package to install.

##### `timedatectl_cmd`

Data type: `Stdlib::Absolutepath`

Command used to set the timezone.

##### `timedatectl_chk`

Data type: `Stdlib::Absolutepath`

Command used to test the current timezone setting.

##### `setlocalrtc_cmd`

Data type: `Stdlib::Absolutepath`

Command used to set if RTC is on UTC time or local time.

##### `setlocalrtc_chk`

Data type: `Stdlib::Absolutepath`

Command used to test the current setting of RTC.

