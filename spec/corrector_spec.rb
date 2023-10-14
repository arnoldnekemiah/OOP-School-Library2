require_relative 'spec_helper'

describe Corrector do
  before :each do
    @corrector = Corrector.new
  end

  it 'should correct the name' do
    expect(@corrector.correct_name('somdotta')).to eq 'Somdotta'
    expect(@corrector.correct_name('somdottasarkar')).to eq 'Somdottasa'
    expect(@corrector.correct_name('microverseinc')).to eq 'Microverse'
  end
end
