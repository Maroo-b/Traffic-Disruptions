class GetTrafficDisruptions

  BASE_URL = "http://data.tfl.gov.uk/tfl/syndication/feeds/tims_feed.xml?app_id=#{ENV['app_id']}&app_key=#{ENV['app_key']}"


  # return Array of disruption point coordinates
  # exp:
  # [
  #   {
  #     lat: 51.501686,
  #     lng: -0.151322
  #   },
  #   {
  #     lat: 51.500506,
  #     lng: -0.126744
  #   }
  # ]

  def self.call
    new.call
  end

  def call
    xml_response = HTTParty.get(BASE_URL)
    hash_response = Hash.from_xml(xml_response.body)
    res = hash_response["Root"]["Disruptions"].map do |disruptions|
      build_point_coordinate(disruptions[1])
    end
    res.flatten
  end

  private 

  attr_reader :http_adapter

  def initialize(http_adapter = HTTParty)
    @http_adapter = http_adapter
  end

  def build_point_coordinate(disruptions)
    disruptions.map do |disruption|
      coord = disruption["CauseArea"]["DisplayPoint"]["Point"]["coordinatesLL"]
      {
        lat: coord.split(',').last.to_f,
        lng: coord.split(',').first.to_f
      }
    end
  end

end
