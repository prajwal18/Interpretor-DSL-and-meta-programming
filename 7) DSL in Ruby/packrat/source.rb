require 'fileutils'

class Source
  attr_reader :files, :base_dir

  def initialize(base_dir, filter)
    @files = filter.evaluate(base_dir)
    @base_dir = base_dir
  end

  def backup(backup_path)
    # copy file from dir to backup_path
    files.each do |file|
      backup_file(file, backup_path)
    end
  end

  def backup_file(path, backup_path)
    file_path = path.sub(base_dir, '')
    copy_path = File.join(backup_path, file_path)
    FileUtils.mkdir_p(File.dirname(copy_path))
    FileUtils.cp(path, copy_path)
  end
end
