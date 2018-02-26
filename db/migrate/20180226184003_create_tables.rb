class CreateTables < ActiveRecord::Migration[5.1]
  def change
    create_table(:tasks) do |t|
      t.column(:description, :string)
      t.column(:done, :boolean)

      t.timestamps()
    end

    create_table(:lists) do |t|
      t.column(:name, :string)
      t.column(:description, :string)

      t.timestamps()
    end
  end
end
