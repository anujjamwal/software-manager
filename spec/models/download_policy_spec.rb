require 'spec_helper'

describe DownloadPolicy do
  it {should validate_uniqueness_of :type}
end
