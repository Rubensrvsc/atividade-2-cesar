require 'rails_helper'

RSpec.describe Comment, type: :model do
  context '#success' do
    before(:all) do
      @movie = Movie.new(
        title: 'Homem Formiga e vespa',
        year: 2019
      )
      @actor = Actor.create(
        name: 'actor 2',
        email: 'actor2@mail.com',
        year: 1999
      )
      @movie.actors << Actor.first

      @movie.save

      @comment_saved = Comment.new(
        body: 'Filme muito bom recomendo demais!',
        approved: false,
        movie_id: Movie.first.id
      )
          
    end

    it { expect(@comment_saved.valid?).to be_truthy }

    it { expect(@comment_saved.save).to be_truthy }
  end

  context '#failure' do
    before(:all) do
      @comment_saved = Comment.new(
        approved: false
      )
    end
      
    it { expect(@comment_saved.valid?).to be_falsey }

    it { expect(@comment_saved.save).to be_falsey }

    it { expect(@comment_saved.errors[:body][0]).to eq("can't be blank") }
  end
end
