class Terry < ParseResource::Base
  fields :name

  validates_presence_of :name

end