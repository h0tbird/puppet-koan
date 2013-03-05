#------------------------------------------------------------------------------
# Define: koan::system
#
#   This define is part of the koan module.
#   The delegated class is Class['koan'].
#
#   Marc Villacorta <marc.villacorta@gmail.com>
#   2013-03-05
#
#------------------------------------------------------------------------------
define koan::system (

    $size   = '4096',
    $volume = 'vg0',

) {

    $templates = getvar("${module_name}::params::templates")

    file { "/root/systems/${title}.${::domain}.sh":
        ensure  => present,
        content => template("${templates}/system.sh.erb"),
        owner   => 'root',
        group   => 'root',
        mode    => '0755',
    }
}
