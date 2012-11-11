class Subscriber
  include Mongoid::Document
  store_in session: "default"

  field :email, type: String
  field :filters, type: Array, default: []

  validates :email, presence: true

  def unsubscribe_url
    "http://seao.ca/unsubscribe/#{id}"
  end
end