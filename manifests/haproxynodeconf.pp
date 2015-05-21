# == Class: haproxy::haproxynodeconf
#
# A Puppet module, using storeconfigs, to model an haproxy configuration.
# Currently VERY limited - assumes Redhat/CentOS setup. Pull requests accepted!
#
class haproxy::haproxynodeconf(
  $name_listen      = 'mysql-percona',
  $ipaddress_vip    = $::keepalived::vrrp::instance::virtual_ipaddress,
  $port_listen      = '3306',
  $mode_listener    = 'tcp',
  $options_listener = [ 'httpchk', ],
  $balance_method     = 'roundrobin',
)  {

haproxy::listen { $name_listen:
  ipaddress => $ipaddress_vip,
  ports     => $port_listen,
  mode      => $mode_listener,
  options   => {
    'option'  => $options_listener,
    'balance' => $balance_method,
  },
}

}
