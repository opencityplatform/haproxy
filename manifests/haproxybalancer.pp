# == Class: haproxy::haproxynodeconf
#
# A Puppet module, using storeconfigs, to model an haproxy configuration.
# Currently VERY limited - assumes Redhat/CentOS setup. Pull requests accepted!
#
class haproxy::haproxybalancer(
  $name_balancer        = 'haproxy',
  $listen_service_name  = $::haproxy::haproxynodeconf::name_listen,
  $service_port         = '3306',
  $port_checker         = '9200',
  $servers              = ['server1', 'server2','server3'],
  $ipadress_servers     = ['ipaddr1', 'ipaddr2','ipaddr3'],
  $balancer_options     = 'inter 12000 rise 3 fall 3',
) {

haproxy::balancermember { $name_balancer:
  listening_service => $listen_service_name,
  ports             => $service_port,
  portcheck         => $port_checker,
  server_names      => $servers,
  ipaddresses       => $ipadress_servers,
  options           => $balancer_options,
}

}
