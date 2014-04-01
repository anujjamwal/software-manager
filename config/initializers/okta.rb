settings = YAML.load(File.read(File.join(Rails.root, 'config', 'auth.yml')))[Rails.env]
$auth_strategy = settings['strategy'].to_sym

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :saml,
           #:assertion_consumer_service_url     => "consumer_service_url",
           :issuer                             => "http://localhost:3000",
           :idp_sso_target_url                 => settings['okta']['target_url'],
           :idp_sso_target_url_runtime_params  => {:redirectUrl => :RelayState},
           #:idp_cert                           => "-----BEGIN CERTIFICATE-----\n...-----END CERTIFICATE-----",
           :idp_cert_fingerprint               => settings['okta']['fingerprint'],
           :name_identifier_format             => "urn:oasis:names:tc:SAML:1.1:nameid-format:emailAddress"
end