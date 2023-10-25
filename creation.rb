require_relative 'book'
require_relative 'person'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'
require_relative 'list'

module Creator
  include Lister
  def create_person
    print 'Would you like to create a student (1) or a teacher (2)? Select a number: '
    choice = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Age: '
    age = gets.chomp.to_i

    case choice
    when '1'
      create_student(name, age)
    when '2'
      create_teacher(name, age)
    else
      puts 'Invalid choice. Please try again.'
    end
  end

  def create_student(name, age)
    print 'Parent permission? [Y/N]: '
    permission_option = gets.chomp.downcase
    student = Student.new(age, name, parent_permission: permission_option == 'y')
    @people << student
    puts "Student created successfully. ID is #{student.id}"
  end

  def create_teacher(name, age)
    print 'Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(specialization, name, age)
    @people << teacher
    puts "Teacher created successfully. Teacher ID is #{teacher.id}"
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp

    if title.strip != '' && author.strip != ''
      book = Book.new(title, author)
      @books << book
      puts 'Book created successfully.'
    else
      puts 'Please enter the book title and author.'
    end
  end

  def create_rental
    if @books.empty? || @people.empty?
      puts 'Nothing to see here.'
    else
      puts 'Enter the number of the book you want: '
      list_books
      book_number = gets.chomp.to_i - 1
      puts 'Enter the number of the person: '
      list_people
      person_number = gets.chomp.to_i - 1
      if person_number.negative? || person_number >= @people.length
        puts 'Invalid person number. Please enter a valid number.'
        return
      end
      print 'Enter the date [yyyy-mm-dd]: '
      date = gets.chomp.to_s
      rental = Rental.new(date, @books[book_number], @people[person_number])
      @rentals << rental
      puts 'Book rented successfully.'
    end
  end
end
