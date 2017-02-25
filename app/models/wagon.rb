class Wagon < ApplicationRecord
  belongs_to :train
  
  validates :number, presence: { message: 'номер не назначен' }
  validates :number, uniqueness: { scope: :train_id }
  
  before_validation :count_number

  scope :at_first, -> { order('number ASC') }
  scope :from_end, -> { order('number DESC') }
  scope :economy,  -> { where(type: 'EconomyWagon') }
  scope :coupe,    -> { where(type: 'CoupeWagon') }
  scope :sv,       -> { where(type: 'SVWagon') }
  scope :sitting,  -> { where(type: 'SittingWagon') } 

  protected

  def count_number
    self.number = Wagon.where(train_id: self.train).maximum('number').to_i + 1
  end
end
