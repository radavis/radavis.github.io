The Path: User Story -> Acceptance Criteria -> Feature Test


## Generic User Story

As a ..
I want ..
So that ..


## User Story

As an urban explorer,
I want to record an experience (location, activity),
So that I can share things to do in a city with others.


## Acceptance Criteria

* [ ] - Need to be able to record the name of the location, description.
* [ ] - Recording price, date/time are optional fields.
* [ ] - If I fill out the form correctly, I should get a successful message.
* [ ] - If I any required fields, I'm sent back to the form with error messages.

```ruby
# spec/features/create_experience_spec.rb

require "rails_helper"

feature "create experience" do
  scenario "fill out form correctly" do
    user = FactoryGirl.create(:user)
    sign_in user

    visit root_path

    click_link "Add New Experience"
    fill_in "Name", with: "Visit Avana Sushi"
    fill_in "Location", with: "Boston, MA"
    fill_in "Description", with: "Best sushi in town"
    fill_in "Price", with: "$10"
    click_link "Create Experience"

    expect(page).to have_content("New experience created")
  end

  scenario "forgot some fields" do
    # set up (create models, sign in)
    # visit a page
    # interact with page (fill_in, click links and buttons)
    # expect something
  end

  scenario "forgot some fields" do
    # set up (create models, sign in)
    # visit a page
    # interact with page (fill_in, click links and buttons)
    # expect something
  end
end
```

```ruby
def sign_in(user)
  visit root_path
  click_link "Sign in"
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  click_button "Sign in"
end
```

## User Story

As an urban explorer,
I want to upload a photo of my experience,
So I can share it with others.
