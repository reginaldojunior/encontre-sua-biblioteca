# frozen_string_literal: true

class CreateLibrary < ActiveRecord::Migration[5.2]
  def change
    create_table :libraries do |t|
      t.string :name
      t.text :description
      t.string :image_src
      t.string :latitude, :decimal, { precision: 10, scale: 6 }
      t.string :longitude, :decimal, { precision: 10, scale: 6 }
      t.timestamps
    end
  end
end
