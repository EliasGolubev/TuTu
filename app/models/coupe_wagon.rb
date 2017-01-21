class CoupeWagon < Wagon 
  validates :bottom_seats, :top_seats, presence: { message: 'не указано количество мест' }
end