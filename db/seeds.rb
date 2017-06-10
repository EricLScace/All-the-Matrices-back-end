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
Width.delete.all
puts `Erased widths table.`
csv = CSV.parse(
  File.read('data/widths.csv'),
  headers: true,
  encoding: 'ISO-8859-1'
)
puts csv
csv.each do |row|
  puts row[width].to_s
  Width.create(
    width: row['width']
  )
end
puts "There are #{Width.count} rows in the widths table."

# This file should contain all the record creation needed to seed the database
# with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the
# db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
