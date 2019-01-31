node 'default' {
  require secrets 

  file { '/tmp/login':
    ensure    => file,
    content   => "${secrets::artifactory_login.unwrap}",
    show_diff => false, # don't log file content
  }

  file { '/tmp/api-key':
    ensure    => file,
    content   => "${secrets::artifactory_api_key.unwrap}",
    show_diff => false,
  }

}
