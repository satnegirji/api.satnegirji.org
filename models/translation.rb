require_relative '../lib/language'


class Translation < ActiveRecord::Base
  validates :original_id, presence: true
  validates :translation_id, presence: true
  validates :original_id, uniqueness: { scope: :translation_id }
  validates :translation_id, uniqueness: { scope: :original_id }

  belongs_to :original, class_name: "Word"
  belongs_to :translated, class_name: "Word", foreign_key: "translation_id"
end
