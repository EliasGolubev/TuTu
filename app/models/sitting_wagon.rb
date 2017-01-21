class SittingWagon < Wagon 
  validates :sitting_seats, presence: { message: 'не указано количество мест' }
end