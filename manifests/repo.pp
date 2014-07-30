class puppet::repo (
  $devel_repo = false,
) inherits puppet::params {
  #input validation
  validate_bool($devel_repo)

  include ::apt
  apt::source { 'puppetlabs':
    location   => 'http://apt.puppetlabs.com',
    repos      => 'main dependencies',
    key        => '4BD6EC30',
    key_server => 'pgp.mit.edu',
  }
  apt::source { 'puppetlabs_devel':
    ensure     => $devel_repo ? {
      default => absent,
      true    => present,
    },
    location   => 'http://apt.puppetlabs.com',
    repos      => 'devel',
    key        => '4BD6EC30',
    key_server => 'pgp.mit.edu',
  }
}
