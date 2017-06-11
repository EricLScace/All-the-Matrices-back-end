# frozen_string_literal: true

class AddOrganizationToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :organization, :text
  end
end
