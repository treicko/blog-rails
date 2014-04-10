class CreateComentarios < ActiveRecord::Migration
  def change
    create_table :comentarios do |t|

      t.timestamps
    end
  end
end
