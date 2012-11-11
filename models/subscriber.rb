class Subscriber
  include Mongoid::Document

  field :email, type: String
  field :filters, type: Array, default: []

  validates :email, presence: true

  def unsubscribe_url
    "http://seao.ca/unsubscribe/#{id}"
  end
end