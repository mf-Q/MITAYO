class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string    :title, null: false, unique: true, index:true 
      t.string    :genre, null: false
      t.date      :timing, default: ""
      t.string    :place, null: false
      t.integer   :number, default: 1
      t.text      :content
      t.references  :user, foreign_key: true
      t.timestamps
    end
  end
end
