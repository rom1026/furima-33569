class DaysToShip < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: '1〜２日で発送' },
    { id: 2, name: '2〜３日で発送' },
    { id: 3, name: '4〜７日で発送' },
  ]

  include ActiveHash::Associations
  belongs_to :items

end
