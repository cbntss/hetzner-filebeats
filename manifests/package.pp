# Basic setup of filebeats repository and installtion
# More details see: https://www.elastic.co/guide/en/beats/libbeat/current/setup-repositories.html
class filebeats::package {
  case $::osfamily {
    'Debian': {
      if ($manage_repo == true) {
          require => Class['::elastic_stack::repo']
      }
      package {'filebeat':
        ensure  => present,
     }
     Class['apt::update'] -> Package['filebeat']

    }
    'RedHat': {
      if ($manage_repo == true) {
          require => Class['::elastic_stack::repo']
      }
      package {'filebeat':
        ensure  => present,
      }
    }
    default: {
      fail('Could not configure apt resource for elasticsearch filebeats')
    }
  }

}
