require 'spec_helper'

describe "StaticPages" do

  let(:base_title) {"Project2"}

  describe "Home page" do
    it "shoul have the content 'Project2'" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit root_path
      expect(page).to have_content('Project2')
    end

    it "should have the right title" do
      visit root_path
      expect(page).not_to have_title(" | Home")
    end
    it "should have the base title" do
      visit root_path
      expect(page).to have_title("Project2")
    end
  end

  describe "Help page" do
    it "should have the content 'Help'" do
      visit help_path
      expect(page).to have_content('Help')
    end

    it "should have the right title" do
      visit help_path
      expect(page).to have_title("#{base_title} | Help")
    end
  end

  describe "About page" do
    it "shoul have the content 'About us'" do
      visit about_path
      expect(page).to have_content('About us')
    end

    it "should have the right title" do
      visit about_path
      expect(page).to have_title("#{base_title} | About us")
    end
  end

  describe "Contact" do
    it "should have the content 'COntact'" do
      visit contact_path
      expect(page).to have_content('Contact')
    end
  end

  it "should have the right title" do
    visit contact_path
    expect(page).to have_title("#{base_title} | Contact")
  end


end