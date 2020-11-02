class Instrument < ActiveRecord::Base
    belongs_to :user
    validates :name, :practice_time, presence: true 
end
