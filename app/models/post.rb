class Post < ApplicationRecord
    validates :content ,{presence:true}
    validates :author ,{presence:true}
    validates :category ,{presence:true}
end
