# frozen_string_literal: true

class MatrixSerializer < ActiveModel::Serializer
  attributes :version, :matrix, :code, :normal_typeface,
             :aux1_typeface, :aux2_typeface
end
