require 'rail_helper'

describe MoviesController do
    describe 'Search movies by the same director' do
        it 'shoud call Movie,similar_movies' do
            expect(Movie).to receive(:similar_movies).with()    
end