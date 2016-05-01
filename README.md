# gtfs-geojson
[![Circle CI](https://circleci.com/gh/tyleragreen/gtfs-geojson.svg?style=svg)](https://circleci.com/gh/tyleragreen/gtfs-geojson)

gtfs-geojson is a Ruby utility to convert the shapes.txt file of a GTFS feed into a GeoJSON file. It uses the [GTFS](https://github.com/nerdEd/gtfs) gem to validate GTFS feeds and wrap the feed data into usable objects. Two command-line utilities are also included with a gem install.

## Installation

Add the following to your Gemfile.
```
gem 'gtfs-geojson'
```
or install the gem through the command line.
```
gem install `gtfs-geojson`
```

## Command-Line Utilities
Convert a GTFS feed shapes.txt file into a GeoJSON file.
```
gtfs_to_geojson gtfs.zip output.geojson
```
Print a human-readable form of a GTFS-realtime feed.
```
gtfs-rt_to_json http://developer.mbta.com/lib/GTRTFS/Alerts/VehiclePositions.pb positions.json
```

## Usage

```
require 'gtfs-geojson'
geojson = GTFS::GeoJSON.generate("gtfs.zip")
File.open("gtfs.geojson",'w') do { |f| f.write(geojson) }
```

## Develop Locally
To develop locally, clone the repository and run bundler to setup the necessary gems.
```
bundle install
```
#### Run Tests
```
bundle exec rake
```
#### Run Tests and Collect Code Coverage
```
bundle exec rake coverage
```
## Contribute
Please contact Tyler at [greent@tyleragreen.com](mailto:greent@tyleragreen.com) or file a GitHub Issue with any ideas or suggestions.
