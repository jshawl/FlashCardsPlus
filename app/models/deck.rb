class Deck < ActiveRecord::Base
  belongs_to :user
  has_many :cards, dependent: :destroy
  has_many :decks_subjects
  has_many :subjects, through: :decks_subjects
end
