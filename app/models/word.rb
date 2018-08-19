class Word < ApplicationRecord
  before_save { text.downcase! }
end
