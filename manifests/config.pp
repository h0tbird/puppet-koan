#------------------------------------------------------------------------------
# Class: koan::config
#
#   This class is part of the koan module.
#   You should not be calling this class.
#   The delegated class is Class['koan'].
#
#   Marc Villacorta <marc.villacorta@gmail.com>
#   2013-03-05
#
#------------------------------------------------------------------------------
class koan::config {

    # Collect variables:
    $templates = getvar("${module_name}::params::templates")
    $configs   = getvar("${module_name}::params::configs")

    # Install the configuration files:
    file { $configs[0]:
        ensure  => present,
        content => template("${templates}/virtinstall.py.erb"),
        owner   => 'root',
        group   => 'root',
        mode    => '0644';
    }
}
