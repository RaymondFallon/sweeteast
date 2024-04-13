
require 'rails_helper'

RSpec.describe MovieMerger do
  let(:movie1) { create :movie }
  let(:movie2) { create :movie }

  subject { described_class.new(movie1.id, movie2.id) }

  before do
    [movie1, movie2].each do |movie|
      create :movie_alias, movie: movie
      create :showtime, movie: movie
    end
  end

  describe '#merge' do
    it 'merges the two movies' do
      subject.merge

      movie1.reload
      expect(movie1.aliases.count).to eq 2
      expect(movie1.showtimes.count).to eq 2
      expect(Movie.exists?(movie2.id)).to be false
    end
  end
end
