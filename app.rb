require_relative 'book'
require_relative 'person'
require_relative 'rental'
require_relative 'creation'
require_relative 'list'
require './save_data'
require './load_data'

class App
  include Creator
  include Lister
  include Save
  include Load
  attr_accessor :books, :people, :rentals

  def initialize
    @books = []
    @rentals = []
    @people = []
    load_files
  end

  def start
    loop { choose_option }
  end
end
