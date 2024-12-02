require 'rails_helper'

describe 'GET  /api/v1/movie_theaters/:id' do
  it 'sucess' do
    user = FactoryBot.create(:user, email: 'joao@email.com')
    movie_theater = FactoryBot.create(:user, email: 'joao@email.com')
    get("/api/v1/movie_theaters/#{}")
  end
end