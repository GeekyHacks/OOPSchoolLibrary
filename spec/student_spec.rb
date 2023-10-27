require './student'

describe Student.new 'IT', 24, 'Abdu' do
    it { is_expected.to be_a(Person) } 
    it{is_expected.to have_attributes(classroom: 'IT') } 
    it{is_expected.to have_attributes(age: 24) } 
    it{is_expected.to have_attributes(name: 'Abdu') } 
    it{is_expected.to have_attributes(parent_permission: true) } 
    end