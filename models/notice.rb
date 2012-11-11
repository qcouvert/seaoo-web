class Notice
  include Mongoid::Document
  store_in session: "seaoo_scraper"

  def self.filters filters_params
    filters = []
    filters_params.each do |f|
      inclu = f['include'].split()
      exclu = f['exclude'].split()
      filters << Notice.all.in(categories: f['category']).in(tags: inclu).and.nin(tags: exclu)
    end
    Notice.all.or(filters)
  end
end