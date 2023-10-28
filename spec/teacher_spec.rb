require './teacher'

describe Teacher do
  subject(:teacher) { described_class.new('Math', 35, 'name') }

  it { is_expected.to be_a(Person) }
  it { is_expected.to have_attributes(specialization: 'Math', age: 35, name: 'name') }

  it 'can use services' do
    expect(teacher.can_use_services?).to be(true)
  end
end
