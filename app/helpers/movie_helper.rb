# frozen_string_literal: true

module MovieHelper
  # def partial_desc(movie)
  #   movie.description.to_s.split(' ')[0..word_count_cutoff].join(' ') + '...'
  # end

  def short_movie_desc?(movie)
    return false unless (desc = movie.description).present?

    desc.to_plain_text.split(' ').size < word_count_cutoff
  end

  def word_count_cutoff
    40
  end
end
