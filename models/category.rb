class Category
  include Mongoid::Document
  store_in session: "seaoo_scraper"
end