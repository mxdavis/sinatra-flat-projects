require 'spec_helper'

describe 'Signup' do

  before(:each) do
    visit '/signup'
  end

  it 'renders a form for a user to signup' do
    expect(page.body).to include('<form')
    expect(page.body).to include('<input')
  end

end
