require 'spec_helper'

describe "User pages" do

  subject {page}



  describe "signup page" do
    before { visit signup_path}
    let(:submit) {"Create my account"}

    it {should have_content('Sign up')}
    it {should have_title(full_title('Sign up'))}

    describe "Describe invalid information" do
      it "should not create a user" do
        expect {click_button submit}.not_to change(User, :count)
      end
    end

    describe "Describe valid information" do
      before do
        fill_in "Name",         with: "Example user"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end

       it "should create a user" do
         expect {click_button submit}.to change(User, :count).by(1)
       end
    end
  end

  describe "edit" do
    let(:user) {FactoryGirl.create(:user)}
    before do
      sign_in user
      visit edit_user_path(user)
    end

    describe "with valid information" do
      let(:new_name) {"New Name"}
      let(:new_email) {"new@example.com"}
      before do
        fill_in "Name", with: new_name
        fill_in "Email", with: new_email
        fill_in "Password", with: user.password
        fill_in "Confirm password", with: user.password
        click_button "Save changes"
      end


      it {should have_selector('div.alert.alert-success')}
      it {should have_link('Sign out', href: signout_path)}
      specify {expect(user.reload.name).to eq new_name}
      specify {expect(user.reload.email).to eq new_email}
    end

    describe "page" do
      it {should have_content("Edit your profile")}
      it {should have_title(user.name)}
      it {should have_link('change', href: 'http://gravatar.com/emails')}
    end

    describe "wich invalid information" do
      before {click_button "Save changes"}

      it {should have_content('error')}
    end
  end

  describe "autorization", type: :request do
    describe "for non-signed-in users" do
      let(:user) {FactoryGirl.create(:user)}

      describe "when attemptinng to visit a protected page" do
        before do
          visit edit_user_path(user)
          fill_in "Email",    with: user.email
          fill_in "Password", with: user.password
          click_button "Sign in"
        end

        describe "after signing in" do

          it "should render the desired protected page" do
            expect(page).to have_title(user.name)
          end
        end
      end

      describe "in the Users controller" do

        describe "visiting to edit pages" do
          before {visit edit_user_path(user)}
          it {should have_title('Sign in')}
        end

        describe "submitting to the update action" do
          before {patch user_path(user)}
          specify {expect(response).to redirect_to(signin_path)}
        end
      end
    end

    describe "as wrong user" do
      let(:user) { FactoryGirl.create(:user) }
      let(:wrong_user) { FactoryGirl.create(:user, email: "wrong@example.com") }
      before { sign_in user, no_capybara: true }

      describe "submitting a GET request to the Users#edit action" do
        before { get edit_user_path(wrong_user) }
        specify { expect(response.body).not_to match(full_title('Edit user')) }
        specify { expect(response).to redirect_to(root_path) }
      end

      describe "submitting a PATCH request to the Users#update action" do
        before { patch user_path(wrong_user) }
        specify { expect(response).to redirect_to(root_path) }
      end
    end
  end

  describe "Profile page " do
    let(:user) {FactoryGirl.create(:user)}

    before {visit user_path(user)}

    it {should have_content(user.name)}
    it {should have_title(user.name)}
  end

end
