# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

class roles_profiles::roles::mozilla_b_1_osx {
  include roles_profiles::profiles::timezone
  include roles_profiles::profiles::ntp
  include roles_profiles::profiles::network
  include roles_profiles::profiles::vnc
  include roles_profiles::profiles::sudo
  include roles_profiles::profiles::motd
  include roles_profiles::profiles::users
  include roles_profiles::profiles::relops_users
  include roles_profiles::profiles::packages_installed
  include roles_profiles::profiles::talos
  include roles_profiles::profiles::worker
  include roles_profiles::profiles::pipconf
  include roles_profiles::profiles::macos_people_remover
}