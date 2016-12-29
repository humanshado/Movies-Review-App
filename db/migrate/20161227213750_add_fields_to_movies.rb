class AddFieldsToMovies < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :category, :string
    add_column :movies, :duration, :integer
  end
end
