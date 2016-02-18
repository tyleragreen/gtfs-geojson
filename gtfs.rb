require 'gtfs'
require 'json'

module GTFS
  class GeoJSON

    def self.get_shapes(path)
      source = GTFS::Source.build(path)
      
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

File.open('shapes.geojson','w') do |f|
  f.write(GTFS::GeoJSON.get_shapes('gtfs.zip'))
end
