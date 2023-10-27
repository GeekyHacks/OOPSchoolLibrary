require './person'

describe Person.new 23, 'Abdu' do
  it { is_expected.to have_attributes(age: 23) }
  it { is_expected.to have_attributes(name: 'Abdu') }
  it { is_expected.to have_attributes(parent_permission: true) }
end
