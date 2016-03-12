#!/usr/bin/ruby

require_relative 'test_helper'

class TestGtfs < Minitest::Test

  def test_invalid_file_fails_cleanly
    assert_raises(ArgumentError) { GTFS::GeoJSON.generate("non_existent_file") }
  end

  def test_valid_gtfs
    geojson = GTFS::GeoJSON.generate("test/fixtures/valid_gtfs.zip")
    shapes  = File.read("test/fixtures/shapes.geojson")

    assert_equal String, geojson.class
    assert_equal shapes, geojson
  end
    
  def test_invalid_gtfs
    assert_raises(GTFS::InvalidSourceException) { GTFS::GeoJSON.generate("test/fixtures/missing_shapes.zip") }
  end
end
