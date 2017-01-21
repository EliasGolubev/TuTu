class SVWagon < Wagon 
  validates :bottom_seats, :side_bottom_seats, presence: { message: 'не указано количество мест' }
end