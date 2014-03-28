class LicensedDownloadPolicy < DownloadPolicy
  def permit?(software, user)
    user.licenses.where(software_id: software.id).count > 0
  end
end
