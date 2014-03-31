# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
SoftwareManager::Application.initialize!

CASClient::Frameworks::Rails::Filter.configure(
    :cas_base_url => "https://cas.thoughtworks.com/cas"
)