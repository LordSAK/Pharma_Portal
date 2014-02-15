require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the content 'Pharma Portal'" do
      visit '/static_pages/home'
      expect(page).to have_content('Pharma Portal')
    end

    it "should have the title 'Home'" do
      visit '/static_pages/home'
      expect(page).to have_title("Pharma Portal | Home")
    end
  end
end