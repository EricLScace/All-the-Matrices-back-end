# frozen_string_literal: true

require 'csv'

# Import from Linotype csv
csv = CSV.parse(
  File.read('data/LinoFontsbyTriangleNo.csv'),
  headers: true,
  encoding: 'ISO-8859-1'
)
csv.each do |row|
  # Create the Matrix row, if it doesn't already exist
  mat = Matrix.find_or_create_by!(
    code_prefix: row['prefix'],
    code_suffix: row['suffix']
  )

  # Create the manufactuer, if new, and enter into Matrix row
  manu = Manufacturer.find_or_create_by!(
    name: row['manufacturer'],
    symbol: 'Δ'
  )
  mat.manufacturer_id = manu.id

  # Create the typeface paramenters that do not yet exist,
  # create the typeface, if new, and enter into Matrix
  size = OpticalSize.find_or_create_by!(points: row['normal_size'])
  font = Font.find_or_create_by!(font: row['normal_font'])
  face = Face.find_or_create_by!(face: row['normal_face'])
  weight = Weight.find_or_create_by!(weight: row['normal_weight'])
  width = Width.find_or_create_by!(width: row['normal_width'])
  orientation = Orientation.find_or_create_by!(
    orientation: row['normal_orientation']
  )
  typeface = Typeface.find_or_create_by!(
    optical_size_id: size.id,
    font_id: font.id,
    face_id: face.id,
    weight_id: weight.id,
    width_id: width.id,
    orientation_id: orientation.id
  )
  mat.normal_typeface_id = typeface.id
  puts "#{mat.code_prefix}#{manu.symbol}#{mat.code_suffix}: \
#{size.points} pt #{font.font} #{face.face} #{weight.weight} \
#{width.width} #{orientation.orientation}"

  # Aux1 typeface
  size = OpticalSize.find_or_create_by!(points: row['aux1_size'])
  font = Font.find_or_create_by!(font: row['aux1_font'])
  face = Face.find_or_create_by!(face: row['aux1_face'])
  weight = Weight.find_or_create_by!(weight: row['aux1_weight'])
  width = Width.find_or_create_by!(width: row['aux1_width'])
  orientation = Orientation.find_or_create_by!(
    orientation: row['aux1_orientation']
  )
  typeface = Typeface.find_or_create_by!(
    optical_size_id: size.id,
    font_id: font.id,
    face_id: face.id,
    weight_id: weight.id,
    width_id: width.id,
    orientation_id: orientation.id
  )
  mat.aux1_typeface_id = typeface.id
  puts "     with \
#{size.points} pt #{font.font} #{face.face} #{weight.weight} \
#{width.width} #{orientation.orientation}"

  # Aux2 typeface
  size = OpticalSize.find_or_create_by!(points: row['aux2_size'])
  font = Font.find_or_create_by!(font: row['aux2_font'])
  face = Face.find_or_create_by!(face: row['aux2_face'])
  weight = Weight.find_or_create_by!(weight: row['aux2_weight'])
  width = Width.find_or_create_by!(width: row['aux2_width'])
  orientation = Orientation.find_or_create_by!(
    orientation: row['aux2_orientation']
  )
  typeface = Typeface.find_or_create_by!(
    optical_size_id: size.id,
    font_id: font.id,
    face_id: face.id,
    weight_id: weight.id,
    width_id: width.id,
    orientation_id: orientation.id
  )
  mat.aux2_typeface_id = typeface.id
  puts "     and  \
#{size.points} pt #{font.font} #{face.face} #{weight.weight} \
#{width.width} #{orientation.orientation}"
end
