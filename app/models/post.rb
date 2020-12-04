class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 100}

    belongs_to :blogger
    belongs_to :destination

end
