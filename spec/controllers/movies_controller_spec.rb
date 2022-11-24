# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  context '#success' do
    context '#create' do
      before(:all) do
        Actor.create(
          name: 'actor 3',
          email: 'actor3@mail.com',
          year: 1999
        )

        @actor_id = Actor.find_by(name: 'actor 3')
        @movie = {
          movie: {
            title: 'Liga da Justiça 9',
            year: '2009',
            actor_ids: [@actor_id.id]
          }
        }
      end

      it 'create movie' do
        post :create, params: @movie
        expect(subject.status).to eq(302)
        expect(subject.params[:movie][:title]).to eq(@movie[:movie][:title])
      end
    end

    context '#show_comments' do
      before(:all) do
        Actor.create(
          name: 'actor 4',
          email: 'actor4@mail.com',
          year: 1998
        )

        @actor = Actor.find_by(name: 'actor 4')
        Movie.create(
          title: 'Liga da Justiça 3',
          year: '2003',
          actor_ids: [@actor.id]
        )
        @movie = Movie.find_by(title: 'Liga da Justiça 3')

        Comment.create(
          body: 'Filme otimo',
          approved: true,
          movie_id: @movie.id
        )
      end

      it 'showing comments on movie' do
        get :show, params: { id: @movie.id }
        expect(subject.status).to eq(200)
      end
    end
  end

  context '#failure' do
    before(:all) do
      Actor.create(
        name: 'actor 4',
        email: 'actor4@mail.com',
        year: 1999
      )

      @actor_id = Actor.find_by(name: 'actor 3')
      @movie = {
        movie: {
          title: 'Liga da Justiça',
          actor_ids: [@actor_id]
        }
      }
    end

    it 'create movie' do
      post :create, params: @movie
      expect(subject.status).not_to eq(302)
    end
  end
end
