class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :train
  belongs_to :first_station, class_name: 'RailwayStation', foreign_key: :first_station_id
  belongs_to :last_station, class_name: 'RailwayStation', foreign_key: :last_station_id

  validates :fullname, presence: { message: 'не указано имя' }
  validates :passport_number, presence: { message: 'не указан' }

  after_create :send_buy_notification
  after_destroy :send_destroy_notification

  def route_name
    "#{first_station.title} - #{last_station.title}"
  end

  private

  def send_buy_notification
    TicketsMailer.buy_ticket(self.user, self).deliver_now
  end

  def send_destroy_notification
    TicketsMailer.delete_ticket(self.user, self).deliver_now
  end
end
