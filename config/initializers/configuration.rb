require 'ostruct'
require 'yaml'
file = Rails.root.join('config/therearenews.yml')
if File.exist?(file)
  AppConfig = OpenStruct.new(YAML.load_file(file)[Rails.env])
else
  raise ArgumentError.new('you need define your therearenews.yml file')
end
