require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
    context '#success' do
        before(:all) do
            Actor.create(
                name: 'actor 3',
                email: 'actor3@mail.com',
                year: 1999
            )

            @actor_id = Actor.find_by(name: 'actor 3')
            @movie = {
                movie: {
                    title: 'Liga da Justiça',
                    year: 2003,
                    actor_ids: [ @actor_id ]
                }
            }
        end

        it 'create movie' do
            post :create, params: @movie
            expect(subject.status).to eq(302)
            expect(subject.params[:movie][:title]).to eq(@movie[:movie][:title])
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
                    actor_ids: [ @actor_id ]
                }
            }
        end

        it 'create movie' do
            post :create, params: @movie
            expect(subject.status).not_to eq(302)
        end
    end
end