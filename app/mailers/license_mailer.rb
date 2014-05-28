class LicenseMailer < ActionMailer::Base
  default from: "software-manager@thoughtworks.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.license_mailer.request_accepted.subject
  #
  def request_accepted(allocation)
    @license = allocation.license
    @software = @license.software
    user = allocation.user
    mail to: user.email, subject: I18n.t('license_mailer.request_accepted.subject', name: @software.name)
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.license_mailer.request_rejected.subject
  #
  def request_rejected
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.license_mailer.requested.subject
  #
  def requested
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
