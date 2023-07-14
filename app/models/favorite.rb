class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :topic
  #favoriteモデルがUserモデルとTopicモデルに対して1対多
end
