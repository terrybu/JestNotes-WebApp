class Set < ParseResource::Base
  fields :name, :jokes

  validates_presence_of :name

end