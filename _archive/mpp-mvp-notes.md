# MPP MVP Notes

## User Stories

**Mentor Application**

As a Company interested in becoming a Mentor to small businesses,
I want to apply to become a Mentor,
So that I can help other companies participate in SBA.gov contracts.

Acceptance Criteria:

* User fills out Mentor Form
* User reviews form and submits
* ...

**Mentor Invites Protege**

As a Mentor,
I want to invite a small business to become a Protege,
So that they can participate in SBA.gov contracts.


## Questions

* Point of contact: do these map to Users?

## Process

* Cloud.gov vs GovCloud (sounds like we're going with GovCloud - more configuration)


## Bugs

* Devise issue: User password is not stored on signup. Steps to reproduce:
  - visit http://localhost:3000/users/sign_up
  - fill out form, click sign up
  - sign out
  - attempt to sign back in with email/password


## Home Page

### Nav Bar

* Larger/High-quality MPP seal image
* Center links should have larger font weight (bolder text)
* Add spacing between links
* Remove 'Sign Up' button
* Add horizontal padding to text within 'Log in' button (make button larger in the horizontal direction)

### Hero Section

* Add image (as background image)
* Ensure 'impactful statement' lines up correctly with image
* Increase font size of 'impactful statement' to match design

### Call-to-Action Section

* Make font size slightly smaller to match design
* Add vertical spacing between description paragraph and 'Apply' button
* 'Required Docs' link (where does this link to?)
* Protege 'Apply' button should stand out from background (#172B4D)

### Protege Application Section

* Add placeholder section with placeholder text
* 'Required Docs' link

### Footer

* Add 'Home', 'Eligibility', 'Applications', and 'Help' Links to the left of footer section
* Add 'Site Map' to the collection of links on the left
* Add tiny MPP seal image, department title and address to center of footer: 'Department of Defense Mentor-Protégé Program | 4800 Mark Center Drive, Suite 15G13 Alexandria, VA 22540-3601'
* Change color of Social Media icons (#9B9B9B)
* Align Social Media icons to the right
* Make Social Media icons slightly smaller to match design


## Mentor Application

### Nav Bar

* Inverted version of Nav Bar (Black background, White text)
* Add icons: email, bell, avatar to the right

### Flash Messages

* Successful message: circle-check-icon, #BBDEFB background, 'Sign in successful'
* Error message: exclamation-triangle-icon, #FFCDD2 background, 'Error your request could not be processed at this time'


## Error Pages

### 500 Server Error

### 404 Page Not Found
