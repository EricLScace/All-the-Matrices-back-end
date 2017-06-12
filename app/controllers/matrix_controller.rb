# frozen_string_literal: true

# Note: how to add to join table
# users_matrices.user = user

class MatrixController < ProtectedController
  # include ActionView::Helpers
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
  # "normal_typeface": normal_typeface,
  # "aux1_typeface": aux1_typeface,
  # "aux2_typeface": aux2_typeface

  # ===== Private class methods follow =====
  private

  def aux1_typeface
    ''
  end

  def aux2_typeface
    ''
  end

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
    "#{@manu.name} #{@matrix.code_prefix}#{@manu.symbol}#{@matrix.code_suffix}:"
  end

  def matrix_description
    { code: matrix_code, \
      normal_typeface: nil, \
      aux1_typeface: nil, \
      aux2_typeface: nil }
  end

  # def normal_typeface
  #   # E.g., 7½ pt Opticon
  #   # Suppress default field values, which are designated with parenthesis.
  #   # Optical_size should be converted to vulgar fractions if needed.
  #   binding.pry
  #   optical_size = Typeface(@matrix.normal_typeface_id)
  #   # "#{} pt"
  # end
end
