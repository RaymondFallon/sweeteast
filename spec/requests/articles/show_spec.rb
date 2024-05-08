# frozen_string_literal: true

require 'rails_helper'

describe 'GET /articles/:id' do

  it 'displays the article if it\'s published' do
    article = create(:article, :published, title: 'Men is a Mess')
    get article_path(article)
    expect(response.body).to include 'Men is a Mess'
  end

  it 'does not display the article if it\'s not published' do
    article = create(:article, :unpublished)
    get article_path(article)
    expect(response).to redirect_to(articles_path)
  end
end
