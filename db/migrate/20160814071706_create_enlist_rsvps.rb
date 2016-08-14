class CreateEnlistRsvps < ActiveRecord::Migration[5.0]
  def change
    create_table :enlist_rsvps do |t|

      t.timestamps
    end
  end
end
