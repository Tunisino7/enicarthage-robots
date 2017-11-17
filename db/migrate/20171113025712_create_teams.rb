class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.string :leader
      t.string :email
      t.string :password_digest
      t.integer :phone
      t.integer :cin
      t.integer :contest
      t.datetime :date
      t.string :robot
      t.string :university
      t.string :member1
      t.string :member2
      t.string :member3
      t.string :member4
      t.string :member5
      t.string :member6
      t.string :member7
      t.boolean :status
      t.boolean :active

      t.timestamps
    end
  end
end
