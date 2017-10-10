class ikeautomata {

  notify {"Automating $name":}
  file { 'post-hook':
      ensure  => file,
      path    => '/etc/puppet/.git/hooks/post-merge',
      source  => 'puppet:///modules/ikeautomata/post-merge',
      mode    => '0755',
      owner   => 'root',
      group   => 'root',
  }

  cron { 'puppet-apply':
      ensure  => present,
      command => "cd /etc/puppet ; /usr/bin/git pull; cp -R /etc/puppet/modules /etc/puppet/code",
      user    => 'root',
      minute  => '*/05',
      require => File['post-hook'],
  } -> 
  exec { "remove setup file":
      path    => ['/usr/bin','/usr/sbin','/bin','/sbin','/usr/local/bin','/usr/local/sbin'],
      command => 'rm -f /etc/puppet/setup.sh',
  }

}
