require 'spec_helper'

describe "StaticPages" do

  describe "Home page" do
    it "shoul have the content 'Project2'" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit '/static_pages/home'
      expect(page).to have_content('Project2')
    end

    it "should have the right title" do
      visit '/static_pages/home'
      expect(page).to have_title("Project2 | Home")
    end
  end

  describe "Help page" do
    it "should have the content 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_content('Help')
    end

    it "should have the right title" do
      visit '/static_pages/help'
      expect(page).to have_title("Project2 | Help")
    end
  end

  describe "About page" do
    it "shoul have the content 'About us'" do
      visit '/static_pages/about'
      expect(page).to have_content('About us')
    end

    it "should have the right title" do
      visit '/static_pages/about'
      expect(page).to have_title("Project2 | About us")
    end
  end



end
