class ChangeBandColumnname < ActiveRecord::Migration[5.2]
  def change

    rename_column :bands, :band, :name
  end
end
