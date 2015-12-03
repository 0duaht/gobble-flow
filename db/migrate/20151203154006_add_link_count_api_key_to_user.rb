class AddLinkCountApiKeyToUser < ActiveRecord::Migration
  def change
    add_column :users, :link_count, :int, default: 0
    add_column :users, :api_key, :string, default:
    "QKK8l5u74DYX4BL2Z1fUdf1UmdKsfDQYtbYn5T1vv9e3suaSy1dJsp0wZ2JlWaOr"
  end
end
