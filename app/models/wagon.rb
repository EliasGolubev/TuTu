class Wagon < ApplicationRecord
  belongs_to :train
  

  validates :number, presence: { message: 'номер не назначен' }
  
  before_validation :count_number

  scope :sum_coupe_top_seats,    -> { where(type: CoupeWagon).sum('top_seats') }
  scope :sum_coupe_bottom_seats, -> { where(type: CoupeWagon).sum('bottom_seats') }

  scope :sum_economy_top_seats,         -> { where(type: EconomyWagon).sum('top_seats') }
  scope :sum_economy_bottom_seats,      -> { where(type: EconomyWagon).sum('bottom_seats') }
  scope :sum_economy_side_top_seats,    -> { where(type: EconomyWagon).sum('side_top_seats') }
  scope :sum_economy_side_bottom_seats, -> { where(type: EconomyWagon).sum('side_bottom_seats') }

  scope :sum_sv_bottom_seats,      -> { where(type: SVWagon).sum('bottom_seats') }
  scope :sum_sv_side_bottom_seats, -> { where(type: SVWagon).sum('side_bottom_seats') }

  scope :sum_sitting_seats, -> { where(type: SittingWagon).sum('sitting_seats') }
  
  protected

  def count_number
    self.number = Wagon.where(train_id: self.train).maximum('number').to_i + 1
  end
end
