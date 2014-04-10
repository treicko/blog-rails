class CreateHistoricoPosts < ActiveRecord::Migration
  def change
    create_table :historico_posts do |t|
      t.integer :id_post
      t.string :title
      t.string :text

      t.timestamps
    end
  end
end
