require_relative 'book'
require_relative 'person'
require_relative 'rental'

module Lister
  def list_books
    if @books.empty?
      puts 'No books available. Please add some books and try again.'
    else
      puts "There are #{@books.count} book(s) available."
      @books.each_with_index do |book, index|
        puts "#{index + 1}) Title: \"#{book.title}\" | Author: #{book.author}"
      end
    end
  end

  def list_people
    if @people.empty?
      puts 'No people added yet. Please add a person and try again.'
    else
      @people.each_with_index do |person, index|
        puts "#{index + 1}) [#{person.class}] Name: #{person.name} | Age: #{person.age} | ID: #{person.id}"
      end
    end
  end

  def list_all_rentals
    if @rentals.empty?
      puts 'No rentals available at the moment.'
    else
      print 'To view your rentals, enter your ID: '
      id = gets.chomp.to_i
      rental = @rentals.select { |rend| rend.person.id == id }

      if rental.empty?
        puts 'No records for that ID.'
      else
        puts 'Here are your records:'
        puts ''
        rental.each_with_index do |record, index|
          puts "#{index + 1}| Date: #{record.date} | Borrower: #{record.person.name} | " \
               "Status: #{record.person.class} | Borrowed book: \"#{record.book.title}\" by #{record.book.author}"
        end
      end
    end
  end
end
