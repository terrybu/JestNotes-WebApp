class Joke < ParseResource::Base
  fields :name, :bodyText, :score, :user_id

  validates_presence_of :name
  validates_numericality_of :score, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 10

end