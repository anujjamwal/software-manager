namespace :files do
  desc "Load the files from directory and creates software objects in database"
  task sync: :environment do
    base_location = Settings.for('storage')
    accepted_configs = Settings.for('formats')
    print accepted_configs, "\n"

    Dir[File.join(base_location, '*/')].each do |dir|

      os = OperatingSystem.where(name: File.basename(dir)).first_or_create
      extract_files(os, dir, accepted_configs)
    end
  end

  def extract_files(os, dir, accepted_configs)
    @files ||= []
    Dir.entries(dir).reject! { |filename| filename.starts_with? '.' }.each do |item|
      if item.include?(".") then
        file_basename = File.basename(item)
        ext = File.extname(item)
        software = Software.create(
            operating_system: os,
            name: file_basename,
            path: File.absolute_path(item, dir),
            download_policy:  Software::DEFAULT_DOWNLOAD_POLICY.first,
            state: :unapproved
        ) if accepted_configs.include?(ext)

        print "o> ", file_basename
        if software.try(:persisted?)
          print "   Added to database\n"
        elsif !accepted_configs.include?(ext)
          print "   Not accepted format\n"
        else
          print "   Already present. Ignoring\n"
        end
      else
        extract_files(os, File.join(dir, item), accepted_configs) rescue nil
      end

    end
  end
end
