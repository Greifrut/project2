require 'spec_helper'

describe "StaticPages" do
  describe "Home page" do
    it "shoul have the content 'Project2'" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit '/static_pages/home'
      expect(page).to have_content('Project2')
    end
  end

  describe "Help page" do
    it "should have the content 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_content('Help')

    end

  end
end
