require 'date'

class Notice
  include Mongoid::Document
  store_in session: "seaoo_scraper"

  def self.filters filters_params
    filters = []
    filters_params.each do |f|
      inclu = f['include'].split()
      exclu = f['exclude'].split()
      conditions = { categories: f['category'] }
      conditions[:tags.in] = inclu if inclu
      conditions[:tags.nin] = exclu if exclu
      filters << conditions
    end
    Notice.any_of(filters)
  end

  def dateRfc
    Date.parse(information["PublicationDate"]).httpdate
  end
end