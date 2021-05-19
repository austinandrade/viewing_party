class CreateViewingParties < ActiveRecord::Migration[5.2]
  def change
    create_table    :parties do |t|
      t.references  :user, foreign_key: true
      t.string      :movie_title
      t.integer     :duration
      t.date        :date
      t.time        :start_time
      t.integer     :movie_id

      t.timestamps
    end
  end
end
