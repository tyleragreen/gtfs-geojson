#!/usr/bin/ruby

require_relative 'test_helper'

class TestGtfs < Minitest::Test
  def test_valid_gtfs
    assert_equal String, GTFS::GeoJSON.get_shapes("test/fixtures/valid_gtfs.zip").class
  end
  def test_invalid_gtfs
    assert_raises(GTFS::InvalidSourceException) { GTFS::GeoJSON.get_shapes("test/fixtures/missing_shapes.zip") }
  end
end
