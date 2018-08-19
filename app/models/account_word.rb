class AccountWord < ApplicationRecord
  belongs_to :word
  belongs_to :account
end
