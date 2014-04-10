class RemoveEliminarCampo1FromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :campo1, :string
  end
end
