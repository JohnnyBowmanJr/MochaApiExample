class Track < ActiveRecord::Base
  attr_accessible :artist, :title

  def self.search_soundcloud(title)
    # Goes to Soundcloud it returns JSON
    json = HTTParty.get('some_url_to_Sound_cloud')

    results = []

    json.each do |u|
      results << Track.new(:title => json['city'])
    end

    return results
  end

end
