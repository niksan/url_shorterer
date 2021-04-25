class CreateUrlStats < ActiveRecord::Migration[6.1]
  def change
    create_table :url_stats do |t|
      t.integer :url_id
      t.string :ip

      t.timestamps
    end

    add_index :url_stats, :url_id
    add_index :url_stats, %i[url_id ip], unique: true
  end
end
