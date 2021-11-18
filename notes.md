User
    - firstname
    - lastname
    - email
    - password_digest
    - has_many :pins
    - has_many :destinations, through: pins

Pins * Join Table
    - user_id
    - destination_id
    - belongs_to :user
    - belongs_to :destionations
    - rating (user submittable attribute)

Destinations
    - city
    - state (optional)
    - country
    - has_many: pins
    - has_many :users, through: destinations
   
