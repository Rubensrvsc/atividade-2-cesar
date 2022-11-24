# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  context '#success' do
    context '#create' do
      before(:all) do
        Actor.create(
          name: 'actor 5',
          email: 'actor5@mail.com',
          year: 1999
        )

        @actor_id = Actor.find_by(name: 'actor 5')
        Movie.create(
          title: 'Liga da Justiça 2',
          year: '2003',
          actor_ids: [@actor_id.id]
        )
          
        
        @movie_id = Movie.find_by(title: 'Liga da Justiça 2')

        @comment = {
          comment: {
            body: 'Filme muito bom recomendo demais!',
            approved: false,
            movie_ids: [@movie_id.id]
          }
        }

      end

      it 'create comment' do
        post :create, params: @comment
        expect(subject.status).to eq(200)
        expect(subject.params[:comment][:body]).to eq(@comment[:comment][:body])
      end
    end

    # context '#show_comments' do
    #   before(:all) do
    #     Actor.create(
    #       name: 'actor 4',
    #       email: 'actor4@mail.com',
    #       year: 1998
    #     )

    #     @actor = Actor.find_by(name: 'actor 4')
    #     Movie.create(
    #       title: 'Liga da Justiça 3',
    #       year: '2003',
    #       actor_ids: [@actor.id]
    #     )
    #     @movie = Movie.find_by(title: 'Liga da Justiça')

    #     Comment.create(
    #       body: 'Filme otimo',
    #       approved: true,
    #       movie_id: @movie.id
    #     )
    #   end

    #   it 'showing comments on movie' do
    #     get :show, params: { id: @movie.id }
    #     expect(subject.status).to eq(200)
    #   end
    # end
  end

  context '#failure' do
    before(:all) do
      Actor.create(
        name: 'actor 4',
        email: 'actor4@mail.com',
        year: 1999
      )

      @actor_id = Actor.find_by(name: 'actor 3')
      Movie.create(
        title: 'Liga da Justiça 2',
        year: '2003',
        actor_ids: [@actor_id.id]
      )


      @movie_id = Movie.find_by(title: 'Liga da Justiça 2')

      @comment = {
        comment: {
          body: 'Filme muito bom recomendo demais!',
          approved: false,
          movie_ids: [@movie_id.id]
        }
      }
    end

    it 'create cooment' do
      post :create, params: @comment
      expect(subject.status).not_to eq(302)
    end
  end
end
