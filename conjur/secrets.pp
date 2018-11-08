class { 'conjur':
  account            => '{{ CONJUR_ACCOUNT }}',
  appliance_url      => 'https://{{ CONJUR_DNS_NAME }}/api/',
  authn_login        => "host/puppet-${::trusted['hostname']}",
  host_factory_token => Sensitive('placeholder'),
  ssl_certificate    => file('/etc/conjur.pem'),
  version            => {{ CONJUR_VERSION }}
}

class secrets {
  $vendor_oauth_token = conjur::secret('puppet/vendor-oauth-token')
  $postgres_password  = conjur::secret('puppet/postgres-password')
}
