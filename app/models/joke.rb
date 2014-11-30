class Joke < ParseResource::Base
  fields :name, :bodyText, :score, :user_id, :minutes_length, :seconds_length, :write_date

  validates_presence_of :name
  validates_numericality_of :score, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 10

end