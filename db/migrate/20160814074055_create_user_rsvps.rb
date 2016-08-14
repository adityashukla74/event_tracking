class CreateUserRsvps < ActiveRecord::Migration[5.0]
  def change
    create_table :user_rsvps do |t|

      t.timestamps
    end
  end
end
