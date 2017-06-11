# frozen_string_literal: true

class OwnerMatrix < ApplicationRecord
  belongs_to :user
  belongs_to :matrix
end
