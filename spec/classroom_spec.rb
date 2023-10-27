require './classroom'

describe Classroom do 
  subject(:classroom) { described_class.new('Math Classroom') }
  
  it { is_expected.to have_attributes(label: 'Math Classroom') } 

  it 'initially has no students' do
    expect(classroom.students).to be_empty
  end
  
  it 'can add students' do
    student1 = Student.new('Alice')
    student2 = Student.new('Bob')
    
    classroom.add_student(student1)
    classroom.add_student(student2)
    
    expect(classroom.students).to include(student1, student2)
    expect(student1.classroom).to eq(classroom)
    expect(student2.classroom).to eq(classroom)
  end
end
