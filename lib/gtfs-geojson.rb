#!/usr/bin/ruby

require 'gtfs'
require 'json'
require 'gtfs-geojson/version'

module GTFS
  module GeoJSON

    def self.generate(path)
      raise ArgumentError if !File.exist?(path)

      # Confirm the GTFS feed is valid
      source = GTFS::Source.build(path,{strict:true})
      
      routes   = {}
      features = []
     
      # Group the routes by the route id 
      source.shapes.each do |shape|
        if routes[shape.id]
          routes[shape.id] << shape
        else
          routes[shape.id] = [shape]
        end
      end
      
      # Process the data a route at a time
      routes.each do |route,points|
        coordinates = []

        # Sort the points by their point sequence ID, as it may be
        # out of order in the GTFS feed, but must be in order to appear
        # correct for GeoJSON
        points.sort! { |a,b| a.pt_sequence.to_i <=> b.pt_sequence.to_i }
      
        # Add each sorted point to a list of coordinates for this route
        points.each do |point|
          coordinates << [ point.pt_lon.to_f, point.pt_lat.to_f ]
        end

        # Construct a feature and add it to the feature list for this route
        features << { type: 'Feature',
                      properties: { name: route
                                  },
                      geometry: { type: 'LineString',
                                  coordinates: coordinates
                                }
                    }
      
      end
      
      # Create the GeoJSON file by generating a JSON string wrapped 
      # in a FeatureCollection
      return JSON.generate({type: 'FeatureCollection', features: features})
    end
  end
end
