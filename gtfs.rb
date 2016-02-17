require 'gtfs'
require 'json'
#$stdout.sync = true
source = GTFS::Source.build('gtfs.zip')
puts "LENGTH: #{source.shapes.length}"

routes = {}

source.shapes.each_with_index do |shape,index|
  if routes[shape.id]
    routes[shape.id] << shape
  else
    routes[shape.id] = [shape]
  end
  puts "#{shape.pt_lat}, #{shape.pt_lon} #{index}"
end

routes_sorted = {}
features = []
routes.each do |key,value|
  puts "ROUTES #{key}"
  routes_sorted[key] = value.sort { |a,b| a.pt_sequence.to_i <=> b.pt_sequence.to_i }

  coordinates = []
  routes_sorted[key].each do |point|
    coordinates << [ point.pt_lon.to_f, point.pt_lat.to_f ]
  end

  puts "COORDINATES #{coordinates}" if key == "9:01"
      features << {
        type: 'Feature',
        properties: { name: key
                    },
        geometry: {
          type: 'LineString',
          coordinates: coordinates
        }
      }

end

File.open('shapes.geojson','w') do |f|
  f.write(JSON.generate({type: 'FeatureCollection', features: features}))
end
