require 'rails_helper'

RSpec.describe Movie, type: :model do
    context '#success' do
        before(:all) do
            @actor = Actor.new(
                name: 'actor 1',
                email: 'otheractor@mail.com',
                year: 1998
            )
        end

        it { expect(@actor.valid?).to be_truthy }

        it { expect(@actor.save).to be_truthy }
        
    end

    context '#failure' do
        before(:all) do
            @actor = Actor.new(
                email: 'actor1@mail.com',
                year: 1998
            )
        end
        
        it { expect(@actor.valid?).to be_falsey }

        it { expect(@actor.save).to be_falsey }

    end
end