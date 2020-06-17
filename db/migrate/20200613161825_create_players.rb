class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |player|
      player.string :name
      player.string :position
      player.string :height
      player.string :weight
      player.timestamps null: false
    end
  end
end
