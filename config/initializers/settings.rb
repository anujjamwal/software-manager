SETTINGS = YAML.load(File.read(File.join(Rails.root, 'config', 'config.yml')))[Rails.env]

class Settings
  def self.for(name)
    SETTINGS[name]
  end
end