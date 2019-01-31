class { 'conjur':
  account            => '{{ CONJUR_ACCOUNT }}',
  appliance_url      => 'https://{{ CONJUR_DNS_NAME }}',
  authn_login        => 'host/puppet-1',
  host_factory_token => Sensitive('{{ CONJUR_HF_TOKEN }}'),
  ssl_certificate    => file('/etc/conjur.pem'),
  version            => {{ CONJUR_VERSION }}
}

class secrets {
  $artifactory_login = conjur::secret('{{ CONJUR_SECRET_1 }}')
  $artifactory_api_key  = conjur::secret('{{ CONJUR_SECRET_2 }}')
}
