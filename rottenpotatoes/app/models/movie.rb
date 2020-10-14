class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
  
  def self.similar_movies mtitle
    director = Movie.find_by(title: mtitle).director
    return nil if director.nil? or director.blank?
    Movie.where(director: director).plunk(:title)
  end
end
