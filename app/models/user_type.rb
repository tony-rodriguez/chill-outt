class UserType < ApplicationRecord
  has_many :users, foreign_key: :type_id

  def self.anything_but_admin
    self.all.select {|type| type unless type.name.downcase == "admin" }.first
  end

end
