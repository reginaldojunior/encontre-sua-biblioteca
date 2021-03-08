# frozen_string_literal: true

class ChangeColumnTableLibraries < ActiveRecord::Migration[5.2]
  def change
    remove_column :libraries, :latitude
    remove_column :libraries, :longitude
    add_column :libraries, :latitude, :decimal, { precision: 10, scale: 6 }
    add_column :libraries, :longitude, :decimal, { precision: 10, scale: 6 }
  end
end
