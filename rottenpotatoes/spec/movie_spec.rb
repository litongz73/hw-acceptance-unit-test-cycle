  
require 'rails_helper'

describe Movie do
  describe '.find_similar_movies' do
    let!(:movieone) { FactoryGirl.create(:movie, title: "Tenet", director: 'Christopher Nolan') }
    let!(:movietwo) { FactoryGirl.create(:movie, title: 'Interstellar', director: 'Christopher Nolan') }
    let!(:moviethree) { FactoryGirl.create(:movie, title: 'Dazed and Confused', director: 'Quentin Jerome Tarantino') }
    let!(:moviefour) { FactoryGirl.create(:movie, title: "Momento") }

    context 'director exists' do
      it 'finds similar movies correctly' do
        expect(Movie.similar_movies(movieone.title)).to eql(["Tenet", 'Interstellar'])
        expect(Movie.similar_movies(movieone.title)).to_not include(['Dazed and Confused'])
        expect(Movie.similar_movies(moviethree.title)).to eql(['Dazed and Confused'])
      end
    end

    context 'director does not exist' do
      it 'handles sad path' do
        expect(Movie.similar_movies(moviefour.title)).to eql(nil)
      end
    end
  end

  describe '.all_ratings' do
    it 'returns all ratings' do
      expect(Movie.all_ratings).to match(%w(G PG PG-13 NC-17 R))
    end
  end
  
end

