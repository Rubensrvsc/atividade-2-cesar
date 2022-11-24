# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Movie, type: :model do
  context '#success' do
    before(:all) do
      @movie_saved = Movie.new(
        title: 'Os vingadores',
        year: 2011
      )
      @actor = Actor.create(
        name: 'actor 1',
        email: 'actor1@mail.com',
        year: 1998
      )
      @movie_saved.actors << Actor.first
    end

    it { expect(@movie_saved.valid?).to be_truthy }

    it { expect(@movie_saved.save).to be_truthy }
  end

  context '#failure' do
    before(:all) do
      @movie_saved = Movie.new(
        year: 2011
      )
    end

    it { expect(@movie_saved.valid?).to be_falsey }

    it { expect(@movie_saved.save).to be_falsey }

    it { expect(@movie_saved.errors[:title][0]).to eq("can't be blank") }
  end
end
