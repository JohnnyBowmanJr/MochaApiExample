require 'test_helper'

class TrackTest < ActiveSupport::TestCase
  
  context "A Track" do
    setup do
      expected = JSON.parse(File.open('test/fixtures/soundcloud.json').read)
      
      HTTParty.stubs(:get).returns(expected)

      @tracks = Track.search_soundcloud("beatles")
    end

    should "give me a list of songs by the Beatles" do
      assert_equal 20, @tracks.length
      assert @tracks.first.is_a?(Track)
      assert_equal "Berlin", @tracks.first.title
    end
  end


end
