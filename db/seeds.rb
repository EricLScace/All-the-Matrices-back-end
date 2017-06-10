# frozen_string_literal: true

require 'csv'

# Manufacturers table seeding
Manufacturer.delete_all
csv = CSV.parse(
  File.read('data/manufacturers.csv'),
  headers: true,
  encoding: 'ISO-8859-1'
)
csv.each do |row|
  Manufacturer.create(
    name: row['name'],
    symbol: row['symbol']
  )
end
puts "There are #{Manufacturer.count} rows in the manufacturers table."

# Widths table seeding
Width.delete_all
csv = CSV.parse(
  File.read('data/widths.csv'),
  headers: true,
  encoding: 'ISO-8859-1'
)
csv.each do |row|
  Width.create(
    glyph_width: row['width']
  )
end
puts "There are #{Width.count} rows in the widths table."

# Orientations table seeding
Orientation.delete_all
csv = CSV.parse(
  File.read('data/orientations.csv'),
  headers: true,
  encoding: 'ISO-8859-1'
)
csv.each do |row|
  Orientation.create(
    orientation: row['orientation']
  )
end
puts "There are #{Orientation.count} rows in the orientations table."
