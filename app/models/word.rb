class Word < ApplicationRecord
    belongs_to :user

    validates_presence_of :spell, :part_of_speech, :definition
end
