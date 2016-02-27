Gem::Specification.new do |gem|
  gem.name    = 'gtfs-geojson'
  gem.version = GTFS::GeoJSON::VERSION
  gem.date    = Date.today.to_s

  gem.summary     = ''
  gem.description = ''

  gem.authors  = ['tyleragreen']
  gem.email    = ['greent@tyleragreen.com']
  gem.homepage = 'https://github.com/tyleragreen/gtfs-geojson'

  gem.add_dependency 'gtfs'

  gem.add_development_dependency 'simplecov'
  gem.add_development_dependency 'minitest'

  gem.files      = `git ls-files`.split("\n")
  gem.test_files = `git ls-files -- test/*`.split("\n")
end
