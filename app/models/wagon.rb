class Wagon < ApplicationRecord
  belongs_to :train
  

  validates :number, presence: { message: 'номер не назначен' }
  before_validation :count_number

  protected

  def count_number
    self.number = Wagon.where(train_id: self.train).maximum('number').to_i + 1
  end
end
