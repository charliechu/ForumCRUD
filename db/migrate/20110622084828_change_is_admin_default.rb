class ChangeIsAdminDefault < ActiveRecord::Migration
  def self.up
    change_column_default(User, :is_admin, false)
  end

  def self.down
    change_column_default(User, :is_admin,nil)
  end
end
