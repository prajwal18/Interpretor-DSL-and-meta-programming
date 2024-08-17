# Run this exercise from packrat directory
require_relative './backup'
require_relative './packrat'
require_relative '../../6) Interpretor Pattern/filters/exercise2_expression'

eval(File.read('./backup_script.pr'))
Packrat.instance.run
