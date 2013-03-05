#------------------------------------------------------------------------------
# Class: koan
#
#   This module manages the koan client-side helper.
#
#   Marc Villacorta <marc.villacorta@gmail.com>
#   2013-03-05
#
#   Tested platforms:
#       - CentOS 6
#
# Parameters:
#
# Actions:
#
#   Installs, configures and manages the koan client-side helper.
#
# Sample Usage:
#
#   include koan
#
#   or
#
#   class { 'koan': }
#
#   or
#
#   class { 'koan':
#       version => present,
#       systems => ['system01','system02'],
#   }
#
#------------------------------------------------------------------------------
class koan (

    $version = undef,
    $systems = undef,

) {

    # Validate parameters:
    validate_re($version, '^present$|^latest$')
    validate_hash($systems)

    # Register this module:
    if defined(Class['motd']) { motd::register { $module_name: } }

    # Set the requirements:
    anchor { "${module_name}::begin":   } ->
    class  { "${module_name}::params":  } ->
    class  { "${module_name}::install": } ->
    class  { "${module_name}::config":  } ->
    anchor { "${module_name}::end":     }
}
