class CreateCoaches < ActiveRecord::Migration[5.2]
  def change
    create_table :coaches do |coach|
      coach.string :name
      coach.string :type_coach
      coach.integer :team_id
      coach.timestamps null: false
    end
  end
end
