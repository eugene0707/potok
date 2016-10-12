class AddRoleToUsers < ActiveRecord::Migration

  def change
    add_column :users, :role, :integer, comment: 'Роль пользователя'
  end

end
