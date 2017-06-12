# frozen_string_literal: true

require 'csv'

# 1: all matrices are Linotype
# Create the manufactuer, if new, and enter into Matrix row
# Greek upper-case delta used for symbol
@manu = Manufacturer.find_or_create_by!(
  name: 'Linotype',
  symbol: 'Δ'
)

# Import from Linotype csv
@csv = CSV.parse(
  File.read('data/LinoFontsbyTriangleNo.csv'),
  headers: true,
  encoding: 'ISO-8859-1'
)
@csv.each do |row|
  # Create the typeface paramenters that do not yet exist,
  # create the typeface, if new, and enter into Matrix
  @size = OpticalSize.find_or_create_by!(points: row['normal_size'])
  @font = Font.find_or_create_by!(font: row['normal_font'])
  @face = Face.find_or_create_by!(face: row['normal_face'])
  @weight = Weight.find_or_create_by!(weight: row['normal_weight'])
  @width = Width.find_or_create_by!(width: row['normal_width'])
  @orientation = Orientation.find_or_create_by!(
    orientation: row['normal_orientation']
  )
  @typeface_n = Typeface.find_or_create_by!(
    optical_size_id: @size.id,
    font_id: @font.id,
    face_id: @face.id,
    weight_id: @weight.id,
    width_id: @width.id,
    orientation_id: @orientation.id
  )
  puts "#{row['prefix']}Δ#{row['suffix']}: \
#{@size.points} pt #{@font.font} #{@face.face} #{@weight.weight} \
#{@width.width} #{@orientation.orientation}"

  # Aux1 typeface, if any
  @size = OpticalSize.find_or_create_by!(points: row['aux1_size'])
  @font = Font.find_or_create_by!(font: row['aux1_font'])
  @face = Face.find_or_create_by!(face: row['aux1_face'])
  @weight = Weight.find_or_create_by!(weight: row['aux1_weight'])
  @width = Width.find_or_create_by!(width: row['aux1_width'])
  @orientation = Orientation.find_or_create_by!(
    orientation: row['aux1_orientation']
  )
  @typeface1 = Typeface.find_or_create_by!(
    optical_size_id: @size.id,
    font_id: @font.id,
    face_id: @face.id,
    weight_id: @weight.id,
    width_id: @width.id,
    orientation_id: @orientation.id
  )

  unless @size.points.to_s == ''
    puts "     with \
#{@size.points} pt #{@font.font} #{@face.face} #{@weight.weight} \
#{@width.width} #{@orientation.orientation}"
  end

  # Aux2 typeface, if any
  @size = OpticalSize.find_or_create_by!(points: row['aux2_size'])
  @font = Font.find_or_create_by!(font: row['aux2_font'])
  @face = Face.find_or_create_by!(face: row['aux2_face'])
  @weight = Weight.find_or_create_by!(weight: row['aux2_weight'])
  @width = Width.find_or_create_by!(width: row['aux2_width'])
  @orientation = Orientation.find_or_create_by!(
    orientation: row['aux2_orientation']
  )
  @typeface2 = Typeface.find_or_create_by!(
    optical_size_id: @size.id,
    font_id: @font.id,
    face_id: @face.id,
    weight_id: @weight.id,
    width_id: @width.id,
    orientation_id: @orientation.id
  )

  unless @size.points.to_s == ''
    puts "     and  \
#{@size.points} pt #{@font.font} #{@face.face} #{@weight.weight} \
#{@width.width} #{@orientation.orientation}"
  end

  # Place the typefaces in their respective Normal, Aux1 & Aux2 tables,
  # if not already present.
  @normal = NormalTypeface.find_or_create_by!(typeface_id: @typeface_n.id)
  @aux1 = Aux1Typeface.find_or_create_by!(typeface_id: @typeface1.id)
  @aux2 = Aux2Typeface.find_or_create_by!(typeface_id: @typeface2.id)

  # Create the Matrix row, if it doesn't already exist
  Matrix.find_or_create_by!(
    manufacturer_id: @manu.id,
    code_prefix: row['prefix'],
    code_suffix: row['suffix'],
    normal_typeface_id: @normal.id,
    aux1_typeface_id: @aux1.id,
    aux2_typeface_id: @aux2.id
  )
end
