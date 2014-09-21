def register (email:, password:)
  visit root_path
  click_on "Sign Up"

  within "article.sign-up-form" do
    fill_in "Email", :with => email
    fill_in "Password", :with => password
    fill_in "Password confirmation", :with => password
    click_on "Register"
  end
end

def sign_in_with(email:, password:)
  visit root_path
  click_on "Sign In"

  within "article.sign-in-form" do
    fill_in "Email", :with => email
    fill_in "Password", :with => password
    click_on "Sign In"
  end
end

