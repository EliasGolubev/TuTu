class EconomyWagon < Wagon 
  validates :bottom_seats, :top_seats, :side_top_seats, :side_bottom_seats, presence: { message: 'не указано количество мест' }
end
