require 'rails_helper'

RSpec.describe GetTrafficDisruptions do

  describe '.call' do
    it 'returns hash' do
      stub_request(:get, GetTrafficDisruptions::BASE_URL).to_return(body: File.read('spec/stubbed_requests/disruptions.xml'))
      res = [
           {
            lat: 51.501686,
            lng: -0.151322
          },
          {
            lat: 51.500506,
            lng: -0.126744
          }
      ]

      expect(GetTrafficDisruptions.call).to eq(res)
    end
  end
end
