module SoftwaresHelper
  MAP = {1 => 'Freeware'}
  def download_policy(software)
    MAP.fetch(software.download_policy_id, 'Licensed')
  end
end
