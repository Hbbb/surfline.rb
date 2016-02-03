require 'spec_helper'

describe Surfline::Models::Surf do
  let(:data) { JSON.parse(File.open('./spec/fixtures/surf_data.json'){|f| f.read}) }

  before(:each) do
    @model = Surfline::Models::Surf.new data
  end

  describe '#height' do
    it 'returns correct swell height for all groups and time segments' do
      segment_1 = Time.new(2016, 2, 2, 7,13,25)
      segment_2 = Time.new(2016, 2, 2, 11,5,19)
      segment_3 = Time.new(2016, 2, 2, 17,0,0)
      segment_4 = Time.new(2016, 2, 2, 24,0,0)

      expect(@model.height(1, segment_1)).to eq(data['Surf']['spot']['swell_height1'].first.first)
      expect(@model.height(2, segment_2)).to eq(data['Surf']['spot']['swell_height2'].first[1])
      expect(@model.height(3, segment_3)).to eq(data['Surf']['spot']['swell_height3'].first[2])
      expect(@model.height(2, segment_4)).to eq(data['Surf']['spot']['swell_height2'].first[3])
    end
  end

  describe '#direction' do
    it 'returns correct swell direction for all groups and time segments' do
      segment_1 = Time.new(2016, 2, 2, 7,13,25)
      segment_2 = Time.new(2016, 2, 2, 11,5,19)
      segment_3 = Time.new(2016, 2, 2, 17,0,0)
      segment_4 = Time.new(2016, 2, 2, 24,0,0)

      expect(@model.direction(1, segment_1)).to eq(data['Surf']['spot']['swell_direction1'].first.first)
      expect(@model.direction(2, segment_2)).to eq(data['Surf']['spot']['swell_direction2'].first[1])
      expect(@model.direction(3, segment_3)).to eq(data['Surf']['spot']['swell_direction3'].first[2])
      expect(@model.direction(2, segment_4)).to eq(data['Surf']['spot']['swell_direction2'].first[3])
    end
  end

  describe '#period' do
    it 'returns correct swell period for all groups and time segments' do
      segment_1 = Time.new(2016, 2, 2, 7,13,25)
      segment_2 = Time.new(2016, 2, 2, 11,5,19)
      segment_3 = Time.new(2016, 2, 2, 17,0,0)
      segment_4 = Time.new(2016, 2, 2, 24,0,0)

      expect(@model.period(1, segment_1)).to eq(data['Surf']['spot']['swell_period1'].first.first)
      expect(@model.period(2, segment_2)).to eq(data['Surf']['spot']['swell_period2'].first[1])
      expect(@model.period(3, segment_3)).to eq(data['Surf']['spot']['swell_period3'].first[2])
      expect(@model.period(2, segment_4)).to eq(data['Surf']['spot']['swell_period2'].first[3])
    end
  end

  describe '#swell_report' do
    it 'returns correct swell report for all groups and time segments' do
      segment_1 = Time.new(2016, 2, 2, 7,13,25)
      segment_2 = Time.new(2016, 2, 2, 11,5,19)
      segment_3 = Time.new(2016, 2, 2, 17,0,0)
      segment_4 = Time.new(2016, 2, 2, 24,0,0)

      expect(@model.swell_report(1, segment_1)).to eq({height: data['Surf']['spot']['swell_height1'].first.first,
                                                       direction: data['Surf']['spot']['swell_direction1'].first.first,
                                                       period: data['Surf']['spot']['swell_period1'].first.first
                                                      })

      expect(@model.swell_report(2, segment_2)).to eq({height: data['Surf']['spot']['swell_height2'].first[1],
                                                       direction: data['Surf']['spot']['swell_direction2'].first[1],
                                                       period: data['Surf']['spot']['swell_period2'].first[1]
                                                      })

      expect(@model.swell_report(3, segment_3)).to eq({height: data['Surf']['spot']['swell_height3'].first[2],
                                                       direction: data['Surf']['spot']['swell_direction3'].first[2],
                                                       period: data['Surf']['spot']['swell_period3'].first[2]
                                                      })

      expect(@model.swell_report(1, segment_4)).to eq({height: data['Surf']['spot']['swell_height1'].first[3],
                                                       direction: data['Surf']['spot']['swell_direction1'].first[3],
                                                       period: data['Surf']['spot']['swell_period1'].first[3]
                                                      })
    end
  end

  describe '#full_swell_report' do
    it 'returns correct swell report for a given time segment' do
      segment_1 = Time.new(2016, 2, 2, 7,13,25)
      segment_2 = Time.new(2016, 2, 2, 11,5,19)
      segment_3 = Time.new(2016, 2, 2, 17,0,0)
      segment_4 = Time.new(2016, 2, 2, 24,0,0)

      expect(@model.full_swell_report(segment_1)).to eq([
                                                          {height: data['Surf']['spot']['swell_height1'].first.first,
                                                           direction: data['Surf']['spot']['swell_direction1'].first.first,
                                                           period: data['Surf']['spot']['swell_period1'].first.first},

                                                          {height: data['Surf']['spot']['swell_height2'].first.first,
                                                           direction: data['Surf']['spot']['swell_direction2'].first.first,
                                                           period: data['Surf']['spot']['swell_period2'].first.first},

                                                          {height: data['Surf']['spot']['swell_height3'].first.first,
                                                           direction: data['Surf']['spot']['swell_direction3'].first.first,
                                                           period: data['Surf']['spot']['swell_period3'].first.first}
                                                        ])

      expect(@model.full_swell_report(segment_2)).to eq([
                                                            {height: data['Surf']['spot']['swell_height1'].first[1],
                                                             direction: data['Surf']['spot']['swell_direction1'].first[1],
                                                             period: data['Surf']['spot']['swell_period1'].first[1]},

                                                            {height: data['Surf']['spot']['swell_height2'].first[1],
                                                             direction: data['Surf']['spot']['swell_direction2'].first[1],
                                                             period: data['Surf']['spot']['swell_period2'].first[1]},

                                                            {height: data['Surf']['spot']['swell_height3'].first[1],
                                                             direction: data['Surf']['spot']['swell_direction3'].first[1],
                                                             period: data['Surf']['spot']['swell_period3'].first[1]}
                                                        ])

      expect(@model.full_swell_report(segment_3)).to eq([
                                                            {height: data['Surf']['spot']['swell_height1'].first[2],
                                                             direction: data['Surf']['spot']['swell_direction1'].first[2],
                                                             period: data['Surf']['spot']['swell_period1'].first[2]},

                                                            {height: data['Surf']['spot']['swell_height2'].first[2],
                                                             direction: data['Surf']['spot']['swell_direction2'].first[2],
                                                             period: data['Surf']['spot']['swell_period2'].first[2]},

                                                            {height: data['Surf']['spot']['swell_height3'].first[2],
                                                             direction: data['Surf']['spot']['swell_direction3'].first[2],
                                                             period: data['Surf']['spot']['swell_period3'].first[2]}
                                                        ])

      expect(@model.full_swell_report(segment_4)).to eq([
                                                            {height: data['Surf']['spot']['swell_height1'].first[3],
                                                             direction: data['Surf']['spot']['swell_direction1'].first[3],
                                                             period: data['Surf']['spot']['swell_period1'].first[3]},

                                                            {height: data['Surf']['spot']['swell_height2'].first.first,
                                                             direction: data['Surf']['spot']['swell_direction2'].first[3],
                                                             period: data['Surf']['spot']['swell_period2'].first[3]},

                                                            {height: data['Surf']['spot']['swell_height3'].first[3],
                                                             direction: data['Surf']['spot']['swell_direction3'].first[3],
                                                             period: data['Surf']['spot']['swell_period3'].first[3]}
                                                        ])
    end
  end
end