class Track < ActiveRecord::Base
    
    belongs_to :user
    has_one :car
    has_one :driver
    belongs_to :driver
    
end
