namespace :files do
  desc "Load the files from directory and creates software objects in database"
  task sync: :environment do
    base_location = Settings.for('storage')

    default_download_policy = Software::DEFAULT_DOWNLOAD_POLICY.first

    Dir[File.join(base_location, '*/')].each do |dir|

      os = OperatingSystem.where(name: File.basename(dir)).first_or_create

      print "\n\nlooking up in os folder :  #{os.name}\n"

      Dir.entries(dir)
      .select { |f| !File.directory?(f) }
      .reject! { |filename| filename.starts_with? '.' }
      .each do |file|
        file_basename = File.basename(file)
        software = Software.create(
          operating_system: os,
          name: file_basename,
          path: File.absolute_path(file, dir),
          download_policy: default_download_policy,
          state: :unapproved
        )

        print "o> ", file_basename
        if software.id.present?
          print "   Added to database\n"
        else
          print "   Already present. Ignoring\n"
        end
      end
    end
  end
end
