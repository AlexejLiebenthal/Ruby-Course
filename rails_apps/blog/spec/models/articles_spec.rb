# frozen_string_literal: true

require 'rails_helper'

describe Article do
  it 'can be created with a valid title and a valid body' do
    article = Article.new(title: 'Lorem Ipsum', body: 'Lorem Ipsum...')

    expect(article.save).to be_truthy
  end

  it 'can not be created with an invalid title and a valid body' do
    article = Article.new(title: nil, body: 'Lorem Ipsum...')

    expect(article.save).to be_falsy
  end

  it 'can not be created with a valid title and an invalid body' do
    article = Article.new(title: 'Lorem Ipsum', body: 'Lorem')

    expect(article.save).to be_falsy
  end

  it 'can not be created with an invalid title and an invalid body' do
    article = Article.new(title: nil, body: 'Lorem')

    expect(article.save).to be_falsy
  end
end
