require 'spec_helper'

describe SearchController do

  describe "GET 'Search'" do
    it "returns http success" do
      get 'Search'
      response.should be_success
    end
  end

end
