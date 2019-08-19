class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages, id: :uuid do |t|
      t.text :enc_body
      t.integer :destroy_after, default: 0

      t.timestamps
    end
  end
end
