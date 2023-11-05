class Product < ApplicationRecord
  validates :name, :description, presence: true
  before_create :code_generator

  def code_generator
    self.code = SecureRandom.alphanumeric(6).upcase
  end
end
