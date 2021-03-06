class CreateSocials < ActiveRecord::Migration[6.1]
  def change
    create_table :socials do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :name
      t.string :link

      t.timestamps
    end
  end
end
