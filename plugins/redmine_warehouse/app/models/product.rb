class Product < ActiveRecord::Base
    belongs_to :issue
    scope :title_includes, -> (substring) { where("title like ?", "%#{substring}%")}
    validates :title, uniqueness: true, presence: true
    
end
