require './student'

describe Student do
  before(:each) do
    @student = Student.new('classroom', 24, 'name')
  end

  describe '#new' do
    it ' should add new student object' do
      @student = Student.new('classroom', 24, 'name')
    end
  end
  describe '#classroom' do
    it ' should return correct classroom' do
      expect(@student.classroom).to eql('classroom')
    end
  end
end
