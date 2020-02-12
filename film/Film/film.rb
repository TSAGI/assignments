
gem 'activerecord'
gem 'sqlite3'
require 'mini_record'
require 'active_record'

# #connect to sqlite3 database program
ActiveRecord::Base.establish_connection(
  adapter: "sqlite3", 
  database: "Films.sqlite"
)

class Film < ActiveRecord::Base
    field :title, as: :text
    field :country, as: :text
    field :genre, as: :string
    field :rating, as: :integer
    field :description, as: :text
  end

  Film.auto_upgrade!