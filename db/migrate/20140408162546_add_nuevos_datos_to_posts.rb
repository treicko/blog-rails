class AddNuevosDatosToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :campo1, :string
  end
end
