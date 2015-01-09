class Setrecord < ParseResource::Base
  fields :name, :jokes, :createDate, :user

  validates_presence_of :name

end