class User < ActiveRecord::Base
  validates :username, presence: true

  has_many(
    :contacts,
    class_name: 'Contact',
    foreign_key: :user_id,
    primary_key: :id
  )

  has_many(
    :contact_shares,
    dependent: :destroy,
    class_name: 'ContactShare',
    foreign_key: :user_id,
    primary_key: :id
  )

  has_many(
  :shared_contacts,
  dependent: :destroy,
  through: :contact_shares,
  source: :contact
  )
end
