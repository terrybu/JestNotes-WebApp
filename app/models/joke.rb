class Joke < ParseResource::Base
  fields :name, :bodyText, :score

  validates_presence_of :name

end