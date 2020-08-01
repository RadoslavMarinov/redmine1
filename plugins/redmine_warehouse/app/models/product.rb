class Product < ActiveRecord::Base
    belongs_to :issue
    scope :title_includes, -> (substrign) { where("title like ?", "%#{substrign}%")}
    validates :title, uniqueness: true, presence: true
    
end
