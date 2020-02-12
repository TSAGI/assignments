gem 'activerecord', '=4.2.10'
require 'active_record'
# require 'mini_record'

# #connect to sqlite3 database program
ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'film.sqlite3')

class Film < ActiveRecord::Base
    field :title, as: :text
    field :country, as: :text
    field :genre, as: :string
    field :rating, as: :integer
    field :description, as: :text #text is a long string

    # attr_accessor :id, :title, :country, :genre, :rating, :description
  
    # @@library = []
    # @@id = 1;
  
    # def initialize(options)
    #   @title = options[:title]
    #   @country = options[:country]
    #   @genre = options[:genre]
    #   @rating = options[:rating]
    #   @description = options[:description]
    #   @id = @@id
  
    #   @@id += 1
    # end
  
    # def self.create(options)
    #   film = self.new(options)
    #   @@library << film
    #   return film
    # end
  
    # def self.all
    #   return @@library
    # end
  
  end

  Film.auto_upgrade!