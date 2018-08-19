class Account < ApplicationRecord
  before_save { name.downcase! }
end
