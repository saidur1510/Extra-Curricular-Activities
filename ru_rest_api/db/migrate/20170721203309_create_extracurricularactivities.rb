class CreateExtracurricularactivities < ActiveRecord::Migration[5.1]
  def change
    create_table :extracurricularactivities do |t|
      t.string :name
      t.string :department
      t.string :interest

      t.timestamps
    end
  end
end
