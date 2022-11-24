require 'rails_helper'

RSpec.describe Log, type: :model do
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
      @comment_saved.save

      @log_saved = Log.new(
        date_approved: DateTime.now,
        comment_id: Comment.first.id
      )
     
      @log_saved.save
          
    end

    it { expect(@log_saved.valid?).to be_truthy }

    it { expect(@log_saved.save).to be_truthy }
  end

  context '#failure' do
    before(:all) do

      @log_saved = Log.new(
        date_approved: DateTime.now,
      )
    end
      
    it { expect(@log_saved.valid?).to be_falsey }

    it { expect(@log_saved.save).to be_falsey }

    it { expect(@log_saved.errors[:body][0]).to eq(nil) }
  end
end
