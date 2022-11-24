# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LogsController, type: :controller do
  context '#success' do
    # test requests success case
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

        Comment.create(          
          body: 'Filme muito bom recomendo demais!',
          approved: false,
          movie_id: [@movie_id.id]
        )
        @comment_id = Comment.find_by(body: 'Filme muito bom recomendo demais!')

        @log = {
          log: {
            date_approved: '2022-11-24',
            comment_id: [@comment_id.id]
          }
        }

      end

       # test create a log
      it 'create log' do
        post :create, params: @log
        expect(subject.status).to eq(302)
        expect(subject.params[:log][:date_approved]).to eq(@log[:log][:date_approved])
      end
    end

     # test response successfuly
    it 'responds successfully' do
      get :index
      expect(response).to be_successful
    end
  end

  context '#failure' do
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

      Comment.create(          
        body: 'Filme muito bom recomendo demais!',
        approved: false,
        movie_id: [@movie_id.id]
      )
      @comment_id = Comment.find_by(body: 'Filme muito bom recomendo demais!')

      @log = {
        log: {
          date_approved: '2022-11-24',
          comment_id: [@comment_id.id]
        }
      }

    end

    it 'create log' do
      post :create, params: @log
      expect(subject.status).not_to eq(500)
    end
  end
end
