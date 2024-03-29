require 'spec_helper'

describe Surfline::Models::Analysis do
  spot_data = JSON.parse(File.open('./spec/fixtures/reports/spots/analysis_data.json'){|f| f.read})
  region_data = JSON.parse(File.open('./spec/fixtures/reports/regions/analysis_data.json'){|f| f.read})

  shared_examples 'analysis_model' do |data|
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

    describe '#full_report' do
      it 'returns a full analysis report' do
        expected = {
          report_text: data['Analysis']['surfRange'][0],
          surf_max: data['Analysis']['surfMax'][0],
          surf_min: data['Analysis']['surfMin'][0],
          surf_peak: data['Analysis']['surfPeak'][0],
          short_term_forecast: data['Analysis']['short_term_forecast'],
          condition: data['Analysis']['generalCondition'][0],
          datestamp: data['_metadata']['dateCreated'],
          latitude: data['lat'],
          longitude: data['lon'],
          surfline_id: data['id']
        }

        expect(@model.full_report).to eq(expected)
      end
    end
  end

  context 'with spot lookup' do
    include_examples 'analysis_model', spot_data
  end

  context 'with region lookup' do
    include_examples 'analysis_model', region_data
  end

end

