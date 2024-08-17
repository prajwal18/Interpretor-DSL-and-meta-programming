require_relative './source'
require_relative './packrat'

class Backup
  attr_reader :data_sources, :backup_dir

  def initialize
    @data_sources = []
    @backup_dir = '/backup'
    @interval = 60 # in minutes
    yield(self) if block_given?
    Packrat.instance.register_backup(self)
  end

  def backup(dir, filter = All.new)
    @data_sources << Source.new(dir, filter)
  end

  def to(*dirs)
    @backup_dir = File.join(dirs)
  end

  def interval(minutes)
    @interval = minutes
  end

  def run
    while true
      this_backup_dir = Time.new.ctime.tr(':', '_')
      backup_path = File.join(backup_dir, this_backup_dir)
      @data_sources.each { |source| source.backup(backup_path) }
      puts 'Backup complete'
      sleep @interval * 60
    end
  end
end
