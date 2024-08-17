require 'singleton'

class Packrat
  include Singleton

  def initialize
    @backups = []
  end

  def register_backup(backup)
    @backups << backup
  end

  def run
    threads = []
    # Run each backup on it's own thread
    @backups.each do |backup|
      threads << Thread.new { backup.run }
    end
    # makes sure that all our threads complete before our main thread(i.e. the program terminates)
    threads.each { |t| t.join }
  end
end
