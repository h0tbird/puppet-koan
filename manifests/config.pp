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
    $systems   = getvar("${module_name}::systems")

    # Install the configuration files:
    file {

        $configs[0]:
            ensure  => present,
            content => template("${templates}/virtinstall.py.erb"),
            owner   => 'root',
            group   => 'root',
            mode    => '0644';

        $configs[1]:
            ensure => directory,
            owner  => 'root',
            group  => 'root',
            mode   => '0755';
    }

    # Systems:
    create_resources(koan::system, $systems)
}
