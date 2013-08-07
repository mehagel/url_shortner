class Url < ActiveRecord::Base
  validates_format_of :long_url, :with => /.+[a-z0-9]+\.[a-z]{2,4}.*/,
  :message => "Invalid URL!"
end
