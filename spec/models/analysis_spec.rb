require 'spec_helper'

describe Surfline::Models::Analysis do
  let(:data) { JSON.parse(File.open('./spec/fixtures/analysis_data.json'){|f| f.read}) }

  before(:each) do
    @model = Surfline::Models::Analysis.new data
  end

  describe '#report_text' do
    it 'returns correct report text' do
      expect(@model.report_text).to eq(data['Analysis']['surfRange'].first)
    end
  end

  describe '#surf_max' do
    it 'returns correct surf max text' do
      expect(@model.surf_max).to eq(data['Analysis']['surfMax'].first)
    end
  end

  describe '#surf_min' do
    it 'returns correct surf min text' do
      expect(@model.surf_min).to eq(data['Analysis']['surfMin'].first)
    end
  end

  describe 'condition' do
    it 'returns correct general condition text' do
      expect(@model.condition).to eq(data['Analysis']['generalCondition'].first)
    end
  end

  describe '#report_date' do
    it 'returns correct report date of the analysis' do
      expect(@model.report_date).to eq(data['Analysis']['reportdate'])
    end
  end

  describe '#report_time' do
    it 'returns correct report time of the analysis' do
      expect(@model.report_time).to eq(data['Analysis']['report_time'])
    end
  end
end

