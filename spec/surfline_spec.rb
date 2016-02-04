require 'spec_helper'

describe Surfline do
  it 'has a version number' do
    expect(Surfline::VERSION).not_to be nil
  end

  describe 'surf' do
    it 'returns a surf model object' do
      surf = Surfline.surf('windandsea')
      expect(surf.class).to eq(Surfline::Models::Surf)
    end
  end

  describe 'tide' do
    it 'returns a tide model object' do
      tide = Surfline.tide('windandsea')
      expect(tide.class).to eq(Surfline::Models::Tide)
    end
  end

  describe 'wind' do
    it 'returns a wind model object' do
      wind = Surfline.wind('windandsea')
      expect(wind.class).to eq(Surfline::Models::Wind)
    end
  end

  describe 'analysis' do
    it 'returns a analysis model object' do
      analysis = Surfline.analysis('windandsea')
      expect(analysis.class).to eq(Surfline::Models::Analysis)
    end
  end
 end
