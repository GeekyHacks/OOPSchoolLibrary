require './book'

describe Book.new 'Microverse', 'Autum Johe' do 
    it { is_expected.to have_attributes(title: 'Microverse') } 
    it { is_expected.to have_attributes(author: 'Autum Johe') }
 end