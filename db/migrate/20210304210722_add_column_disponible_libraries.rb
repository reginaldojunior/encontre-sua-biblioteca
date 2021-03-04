# frozen_string_literal: true

class AddColumnDisponibleLibraries < ActiveRecord::Migration[5.2]
  def change
    add_column :libraries, :disponible, :boolean
  end
end
