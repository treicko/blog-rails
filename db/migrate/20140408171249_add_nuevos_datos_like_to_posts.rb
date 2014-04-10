class AddNuevosDatosLikeToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :like, :integer
  end
end
