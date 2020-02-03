# BRICE App

## Goal

> The goals of BRICE are to increase flightline efficiency and reduce time spent
> on documentation, especially at the end of the Crew Chief's shift.
> - BRICE app landing page


## Current Features

* Sign off On-Equipment Jobs
* Create New Events
    - Create On-Equipment discrepancies, Generate a JCN
    - Load a JST and related WCEs
    - Add WCEs for Events and JSTs
* View Open Events
    - Input Tail Number, get Events from IMDS
    - View active and scheduled events for Work Centers


## Current Problems

* **User adoption**
* Authentication/Authorization
* Scaling


## User Adoption

Why aren't people using Brice?

* iPad isn't better than pencil and paper (in a Crew Chief's environment).
* Paper logs are easier to page through and review.
* **No WiFi on the flight line.**
* Data Entry into IMDS is part of a Crew Chief's training.
* A typical web app can't solve every problem.
* Paper Forms and Binders are a part of Air Force culture.


## The Vision...

**What if we could completely eliminate manual data entry from the Crew Chief's list of responsibilities?**


## Keep the Paper Logs

```
As a Crew Chief
I want to log Discrepancies and Corrective Actions
So that there is a history of work performed on an aircraft.
```

**Acceptance Criteria**

* Crew Chief has a binder in which they can write down Discrepancies and Corrective Actions.

**Path to Completion**

1. Use existing paper log forms (aka - do nothing).
2. Transition to a designed log form with identified fields.
3. Add OCR features to the form.


## Digitally Capture Paper Logs

```
As a Crew Chief
I want to digitally capture paper logs
So that there is a digital history of aircraft maintenance.
```

**Acceptance Criteria**

* Crew Chief has a device in which they can take photos or scan their logs for upload.
* Crew Chief has a path within the app to upload photos of paper logs.

**Path to Completion**

1. Take a photo and upload it via a web form. Mark page as captured.
2. Batch upload photos.
3. Create a web page that asks for camera permissions, captures a photo, and uploads it. (a la deposit a check w/ your online bank).


## Process the Logs

```
As a Crew Chief performing Data Entry
I want to transcribe digitally captured logs into a system of record
So that there is a single source of truth for the history of aircraft maintenance.
```

**Acceptance Criteria**

* Crew Chief has a web form to input paper logs.

**Path to Completion**

* Use IMDS-CDB for data entry (aka - do nothing).
* Use the existing web app to do data entry (aka - do nothing).
* View photo of digitally captured log. Mark as transcribed once data entry has been performed.
* View single log entry (instead of entire page). Mark as transcribed.
* Write a function: `function(imageFile)` which returns
    - a JSON representation of the fields within the image
    - properties are form field titles
    - values are the OCR text
    - OCR assurance percentage
    - segmented photo of the captured field
* Write a function: `function(data)` which inserts data into IMDS, G081.


## Feature Rollout

### Phase 0

**Proof of concept**

Developer spike:

* Fill out/obtain completed 781-A forms.
* Digitize completed forms.
* Reliably extract OCR data from forms.
* Create a web service:
    - `POST /form-781-a` w/ image payload, return id
    - `GET /form-781-a/:id.json`, return JSON data of processed form

### Phase 1

* Developers:
    - photo upload
    - cloud storage of photos
    - build OCR dataset
* Designers:
    - layout form for digital and print

### Phase 2

* Developers:
    - implement digital and print forms
    - research and test OCR options
* Designers:
    - layout OCR training/Data correction interface

### Phase 3

* Developers:
    - implement OCR training/Data correction interface


## Resources

* [A gentle introduction to OCR](https://towardsdatascience.com/a-gentle-introduction-to-ocr-ee1469a201aa)
* [Have we solved the problem of Handwriting Recognition?](https://towardsdatascience.com/https-medium-com-rachelwiles-have-we-solved-the-problem-of-handwriting-recognition-712e279f373b) - Using convolutional neural networks to analyze handwriting yielded a 0.27% error rate.
* [New York Times is using Google Cloud for OCR](https://cloud.google.com/blog/products/ai-machine-learning/how-the-new-york-times-is-using-google-cloud-to-find-untold-stories-in-millions-of-archived-photos)
* [Amazon Textract](https://aws.amazon.com/textract/)
