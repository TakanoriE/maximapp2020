class Department < ApplicationRecord
    validates :category,{presence:true}
end
