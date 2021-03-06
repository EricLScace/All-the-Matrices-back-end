# frozen_string_literal: true

class User < ApplicationRecord
  include Authentication
  # has_many :examples
  has_many :matrices, through: :owner_matrices
  validates :email, uniqueness: true
end
