class CreateAttendRsvps < ActiveRecord::Migration[5.0]
  def change
    create_table :attend_rsvps do |t|
      t.integer :user_id
      t.integer :event_id
      t.boolean :attending
      t.timestamps
    end
  end
end
