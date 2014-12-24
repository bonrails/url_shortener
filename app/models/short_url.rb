class ShortUrl < ActiveRecord::Base
  validates_presence_of :url

  CHAR_LIST = ('a'..'z').to_a + (0..9).to_a + ('A'..'Z').to_a

  KEY_LENGTH = 10

  before_create :assign_unique_id

  def generate_unique_uid
    (0...KEY_LENGTH).map{ CHAR_LIST[rand(CHAR_LIST.size)] }.join
  end

  def assign_unique_id
    self.uid = generate_unique_uid
  end
end
