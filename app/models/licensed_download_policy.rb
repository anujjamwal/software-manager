class LicensedDownloadPolicy < DownloadPolicy
  def permit?(software, user)
    validity = false
    user.licenses.where(software_id: software.id).each do |license|
      validity ||= license.good?
    end
    validity
  end
end
