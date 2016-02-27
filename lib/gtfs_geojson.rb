#!/usr/bin/ruby

require 'gtfs'
require 'json'

module GTFS
  module GeoJSON

    VERSION = '0.0.2'

    def self.get_shapes(path)
      source = GTFS::Source.build(path,{strict:true})
      
      routes   = {}
      features = []
      
      source.shapes.each do |shape|
        if routes[shape.id]
          routes[shape.id] << shape
        else
          routes[shape.id] = [shape]
        end
      end
      
      routes.each do |route,points|
        coordinates = []
        points.sort! { |a,b| a.pt_sequence.to_i <=> b.pt_sequence.to_i }
      
        points.each do |point|
          coordinates << [ point.pt_lon.to_f, point.pt_lat.to_f ]
        end
      
        features << { type: 'Feature',
                      properties: { name: route
                                  },
                      geometry: { type: 'LineString',
                                  coordinates: coordinates
                                }
                    }
      
      end
      
      return JSON.generate({type: 'FeatureCollection', features: features})
    end
  end
end
