# frozen_string_literal: true

require './game'

describe Game do
  let(:game) { described_class.new }

  it 'can score zeros' do
    game.roll(0)
    game.roll(0)

    expect(game.score).to eq(0)
  end

  it 'can score ones' do
    game.roll 1
    game.roll 1

    expect(game.score).to eq(2)
  end
end
