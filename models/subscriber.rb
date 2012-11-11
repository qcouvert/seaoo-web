class Subscriber
  include Mongoid::Document
  store_in session: "seaoo_scraper"

  field :email, type: String
  field :filters, type: Array, default: []

  validates :email, presence: true

  def unsubscribe_url
    "http://seaoo.ca/unsubscribe/#{id}"
  end
end