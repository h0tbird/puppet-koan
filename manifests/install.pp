#------------------------------------------------------------------------------
# Class: koan::install
#
#   This class is part of the koan module.
#   You should not be calling this class.
#   The delegated class is Class['koan'].
#
#   Marc Villacorta <marc.villacorta@gmail.com>
#   2013-03-05
#
#------------------------------------------------------------------------------
class koan::install {

    # Collect variables:
    $version  = getvar("${module_name}::version")
    $packages = getvar("${module_name}::params::packages")

    # Install the package/s:
    package { $packages: ensure => $version }
}
