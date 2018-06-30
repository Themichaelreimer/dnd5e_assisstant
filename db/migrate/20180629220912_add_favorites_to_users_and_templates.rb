class AddFavoritesToUsersAndTemplates < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_templates do |t|
      t.index :template_id
    end

    create_table :favorite_users do |t|
      t.index :user_id
    end

    create_table :favorite_pairs, id:false do |t|
      t.belongs_to :user, index:true
      t.belongs_to :template, index:true
    end

  end
end
