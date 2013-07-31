#------------------------------------------------------------------------------
# Class: koan::params
#
#   This class is part of the koan module.
#   You should not be calling this class.
#   The delegated class is Class['koan'].
#
#   Marc Villacorta <marc.villacorta@gmail.com>
#   2013-03-05
#
#------------------------------------------------------------------------------
class koan::params {

    # Set location for files and templates:
    $files     = "puppet:///modules/${module_name}/${::operatingsystem}"
    $templates = "${module_name}/${::operatingsystem}"

    # Set OS specifics:
    case $::osfamily {

        'RedHat': {
            $packages = ['koan']
            $configs  = [ '/root/systems' ]
        }

        default: { fail("${module_name}::params ${::osfamily} family is not supported yet.") }
    }
}
