class Relationship < ApplicationRecord
    belongs_to :follower, class_name: "StUser"
    belongs_to :following, class_name: "StUser"
    validates :follower_id, presence: true
    validates :following_id, presence: true
end
