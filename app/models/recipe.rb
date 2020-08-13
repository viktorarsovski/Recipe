class Recipe < ApplicationRecord

  has_many :ingredients, inverse_of: :recipe, dependent: :destroy
  accepts_nested_attributes_for :ingredients, allow_destroy: true, reject_if: :all_blank

  has_many :directions, inverse_of: :recipe, dependent: :destroy
 	accepts_nested_attributes_for :directions, allow_destroy: true, reject_if: :all_blank


  has_attached_file :image, styles: { medium: '400x400#' }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  belongs_to :user

  validates :title, :description, :image, presence: true
end










