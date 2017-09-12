class User < ApplicationRecord

    has_many :words

    validates_presence_of :username
    validates :username, length: (6..15), uniqueness: true
    validates :password, length: (6..20), 
    
    attr_reader :password
end
