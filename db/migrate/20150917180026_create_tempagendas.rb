class CreateTempagendas < ActiveRecord::Migration
  def change
    create_table :tempagendas do |t|
      t.string :welcomer
      t.string :toastmaster
      t.string :wordmaster
      t.string :timer
      t.string :humorist
      t.string :speaker1
      t.string :speaker2
      t.string :speaker3
      t.string :speaker4
      t.string :topicmaster
      t.string :generaleva
      t.string :evaluator1
      t.string :evaluator2
      t.string :evaluator3
      t.string :evaluator4
      t.text :notes

      t.timestamps null: false
    end
  end
end
