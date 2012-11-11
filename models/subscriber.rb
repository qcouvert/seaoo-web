class Subscriber
  include Mongoid::Document

  field :email, type: String
  field :filters, type: Array, default: []

  validates :name, presence: true
end