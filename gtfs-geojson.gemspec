require './lib/gtfs-geojson/version'

Gem::Specification.new do |gem|
  gem.name        = 'gtfs-geojson'
  gem.version     = GTFS::GeoJSON::VERSION
  gem.date        = Date.today.to_s

  gem.summary     = 'Convert GTFS to GeoJSON'
  gem.description = 'gtfs-geojson is a Ruby utility to convert the shapes.txt file from a GTFS feed into a GeoJSON file.'

  gem.authors     = ['tyleragreen']
  gem.email       = ['greent@tyleragreen.com']
  gem.homepage    = 'https://github.com/tyleragreen/gtfs-geojson'
  gem.license     = 'MIT'

  gem.add_dependency 'gtfs', '0.2.5'
  gem.add_dependency 'gtfs-realtime-bindings', '0.0.5'

  gem.add_development_dependency 'simplecov', '0.11.2'
  gem.add_development_dependency 'minitest',  '5.8.4'

  gem.files        = `git ls-files`.split("\n")
  gem.test_files   = `git ls-files -- test/*`.split("\n")
  gem.executables  = ["gtfs-rt_to_json","gtfs_to_geojson"]
  gem.require_path = 'lib'
end
