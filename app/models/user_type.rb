class UserType < ApplicationRecord
  has_many :users, foreign_key: :type_id
end
