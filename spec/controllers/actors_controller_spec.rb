require 'rails_helper'

RSpec.describe ActorsController, type: :controller do
    context '#success' do
        before(:each) do
            @actor = {
                actor: {
                    name: 'João victor',
                    email: 'jv@mail.com',
                    year: 2001
                }
            }
        end

        it 'when create actor' do
            post :create, params: @actor
            expect(subject.status).to eq(302)
            expect(subject.params[:actor][:email]).to eq(@actor[:actor][:email])
        end
    end

    context '#failure' do
        before(:each) do
            @actor = {
                actor: {
                    email: 'jv@mail.com',
                    year: 2001
                }
            }
        end

        it 'when create actor' do
            post :create, params: @actor
            expect(subject.status).not_to eq(302)
        end
        
    end
end