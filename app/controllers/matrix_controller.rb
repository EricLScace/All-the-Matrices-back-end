# frozen_string_literal: true

# Note: how to add to join table
# users_matrices.user = user

class MatrixController < ProtectedController
  include ActionView::Helpers::NumberHelper
  skip_before_action :authenticate, only: :index
  before_action :check_params, :check_version
  before_action :find_matrix, only: %i[index update]
  # before_action :get_current_user, only: %i[index update]

  # GET /matrix
  def index
    # Before_action attempted to retrieve the requested matrix.
    # If no corresponding matrix was found, return a no-content 204 message
    if @matrix
      render json: { "version": @version, "matrix": matrix_description }
    else
      head :no_content
    end
  end

  # ===== Private class methods follow =====
  private

  def check_params
    # Check for mandatory parameters
    params.require(:version)
    params.require(:matrix).require(:code_prefix)
    params.require(:matrix).require(:symbol)
    params.require(:matrix).require(:code_suffix)
  end

  def check_version
    # Check that API version is supported
    @version = '1.0'
    head :not_available unless params[:version] == @version
  end

  def find_matrix
    # Lookup manufacturer    binding.pry
    @manu = Manufacturer.find_by symbol: params[:matrix][:symbol]
    @matrix = Matrix.find_by manufacturer_id: @manu.id, \
                             code_prefix: params[:matrix][:code_prefix], \
                             code_suffix: params[:matrix][:code_suffix]
  end

  def matrix_code
    # E.g., "Linotype 12Δ7920:"
    # Truncate optical size to integer if possible.
    # points = number_with_precision(@matrix.code_prefix, \
    #                                strip_insignificant_zeros: true)
    prefix = number_with_precision(
      @matrix.code_prefix, precision: 2, strip_insignificant_zeros: true
    ).to_s
    "#{@manu.name} #{prefix}#{@manu.symbol}#{@matrix.code_suffix}:"
  end

  def matrix_description
    # For now, go through intermediate tables; refactor these away later.
    normal = NormalTypeface.find @matrix.normal_typeface_id
    aux1 = Aux1Typeface.find @matrix.aux1_typeface_id
    aux2 = Aux2Typeface.find @matrix.aux2_typeface_id
    # assumes tables return blank descriptors if, e.g., aux2 typeface not used
    tfd_normal = tfd normal.typeface_id
    tfd_aux1 = tfd aux1.typeface_id
    tfd_aux2 = tfd aux2.typeface_id
    tfd_compress tfd_aux1, tfd_aux2
    tfd_compress tfd_normal, tfd_aux1
    { code: matrix_code, \
      normal_typeface: tfd_to_s(tfd_normal), \
      aux1_typeface: tfd_to_s(tfd_aux1), \
      aux2_typeface: tfd_to_s(tfd_aux2) }
  end

  def points_to_vulgar(points)
    # Convert fractional points to vulgar equivalent
    if points.nil?
      str = ''
    else
      str = points.floor.to_s
      fraction = (100 * (points - points.floor)).floor
      case fraction
      when 25
        str << '¼ pt'
      when 33
        str << '⅓ pt'
      when 50
        str << '½ pt'
      when 66, 67
        str << '⅔ pt'
      when 75
        str << '¾ pt'
      end
    end
    str
  end

  def tfd(typeface_id)
    # tfd(typeface_id) -- loads the typeface descriptors into a hash
    tf = Typeface.find(typeface_id)
    pts = OpticalSize.find(tf.optical_size_id)[:points]
    {
      points: points_to_vulgar(pts),
      font: Font.find(tf.font_id)[:font],
      face: Face.find(tf.face_id)[:face],
      weight: Weight.find(tf.weight_id)[:weight],
      width: Width.find(tf.width_id)[:width],
      orientation: Orientation.find(tf.orientation_id)[:orientation]
    }
  end

  def tfd_compress(tfd1, tfd2)
    # tfd_compress deletes descriptors from tfd2 in common with tfd1
    tfd2[:points] = '' if tfd1[:points] == tfd2[:points]
    tfd2[:font] = '' if tfd1[:font] == tfd2[:font]
    tfd2[:face] = '' if tfd1[:face] == tfd2[:face]
    tfd2[:weight] = '' if tfd1[:weight] == tfd2[:weight]
    tfd2[:width] = '' if tfd1[:width] == tfd2[:width]
    tfd2[:orientation] = '' if tfd1[:orientation] == tfd2[:orientation]
  end

  def tfd_to_s(tfd)
    # Convert typeface descriptors tfd hash into a string
    # E.g., 7½ pt Opticon    # Optical_size should be converted to vulgar fractions if needed.
    str = "#{tfd[:points]} #{tfd[:font]} #{tfd[:face]} #{tfd[:weight]} " \
          "#{tfd[:width]} #{tfd[:orientation]}"
    # remove any parenthesis
    # Suppress default field values, which are designated with parenthesis.
    str = str.gsub('roman', '').gsub('normal', '').gsub('regular', '')
    str.gsub('horizontal', '').gsub('()', '').split.join(' ')
  end
end
