class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |team|
      team.string :name
      team.string :username
      team.string :email
      team.string :password
    end
  end
end
