module SoftwaresHelper
  MAP = {1 => 'Freeware'}

  def download_policy(software)
    MAP.fetch(software.download_policy_id, 'Licensed')
  end

  def download_count(software)
    "#{software.download_count > 0 ? software.download_count : 'No'} Downloads"
  end
end
