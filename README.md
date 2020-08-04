# Running Mate

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
The purpose of the app is to develop a platform that construts a running program for an individual based on their experience, the plan they want to commit to, and how fast they want to accomplish the goal. It provides convenience as the program will be organized through a calander to make planning easier for the user.
### App Evaluation
[Evaluation of your app across the following attributes]
- **Category:**
Health 
- **Mobile:**
The app brings the multiple resources needed to plan and execute a training plan to a single app that makes it more convenient for the user.
- **Story:**
When an indiviidual originally looks for a running plan they run into multiple running guides that have one agenda and for the most part not customizable. The app provides a customizable running plan catered to the users preferences.
- **Market:**
As running is an already an established marketing target and endurance racing having more coverage and rise in popularity their has been an influx of new runners looking for somewhere to begin. As it's not only targeted to beginners but also has customizable plans that cater to the expereinced individuals.
- **Habit:**
While the user is using the app, if using one of the programs the app would be a daily habit to monitor workouts, check previous workouts, and acess their weekly plan and activity. 
- **Scope:**
The scope for the project fulfills all the requirments for the app although the app will have a more simplistic UI and being able to create the app will be challenging but defenitly doable before the end of the internship.
## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

- [ ] Setting up our wireframe and skeleton view
- [ ] Creating a Log in screen and having a logout butoon
- [ ] User can create a new profile
- [ ] Establishing a Parse Data base for the project
- [ ] Creating and setting up the home screen
- [ ] Add camera usage for profile picture
- [ ] Have user set goals and prefereneces
- [ ] Create an algorithm that receives user preferences and customizes user workout plan.
- [ ] Create a function that would query the necessary information needed for the stream view and FSCalendar SDK
- [ ] Also have labels that shows this weeks goals and activity in home stream
- [ ] Creating a Tab bar to acess ti three total tabs
- [ ] Use FSCalander Framework to create calander in calander tab
- [ ] Establish the settings tab and creating a detail view controller for Notifications
- [ ] Set notifications to remind user of workouts
- [ ] Be able to properly tranistion throughout all screens.
- [ ] Have all 3 Tabs to interacts sommothly
- [ ] Fix UI and implement an external library.
- [ ] Incorporate animations and gestures


**Optional Nice-to-have Stories**

- [ ] Decorate and made the UI look great - Created my own logos, assets, and color scheme to decorate the UI. I also used view containers to apply shadows to various objects to improve the appearence to the user.
- [ ] Add additional features to Calendar - User UI was imporved and also the User has the ability to mark they finished a workout. When user marks they finished a workout they also recieve "congrats" alert.
- [ ] Creating a detail view controller for Notifications
- [ ] Implementing Notifications
- [ ] User can create an invent directly from the calendar.
- [ ] Use an API which retreives all nearby races and be able to create an event in FSCalendar.


### 2. Screen Archetypes

* [Login & Setup]
   * [Accepting various types of form input from user for basic login / signup]
   * [Validation of form inputs for invalid data (i.e Invalid inputs)]
   * [Integrating third-party connection SDKs (i.e Calander SDK)]
 
* [Streaming]
   * [Set up a navigation controller for the home page]
   * [Properly set up the layout in storyboard and create outlets]
   * [Have home page display an overview of current day workout plan and user activity throughout workout plan]

* [Settings]
   * [Create a new view controller that will be connected though tabs.]
   * [Properly layout the story board and create it's outlets]
   * [Create cells for "Goals", "log out"and "about"]
   * [Each label will have it's own segue to a details view controller where it will allow the user to customize some prefrences, have details on how the app works, and give the user the ability to log out.]
   * [Allow user to customize goals for daily,weekly, and monthly purposes.]
   * [Be able to send notifications as reminders for upcoming workouts or events]

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* [Calander]
* [Home]
* [Settings]

**Flow Navigation** (Screen to Screen)

* [Home]
   * [Home Stream]
   * [Update Profile Image]
   
* [Calander]
   * [Event]
   * [Todays workout]
   * [FSCalendar]
* [Settings]
   * [Goals]
   * [About page]
   * [Log Out]
   
   
## Wireframes
[Add picture of your hand sketched wireframes in this section]
<a href="https://ibb.co/rvmppg3"><img src="https://i.ibb.co/x3DggyY/wireframe.jpg" alt="wireframe" border="0"></a>
<a href="https://ibb.co/cgz6P1m"><img src="https://i.ibb.co/kHY4pxd/Wireframe-2.jpg" alt="Wireframe-2" border="0"></a>

## Schema 
### Models
#### Post

   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | objectId      | String   | unique id for the user post (default field) |
   | author        | Pointer to User| image author |
   | image         | File     | Profile Image of User |
   | notes.        | String   | Note created for the workout |
   | createdAt     | DateTime | date when post is created (default field) |
   | updatedAt     | DateTime | date when post is last updated (default field) |
   | Miles Ran     | Number.  | Log the total amount of miles ran by user |
   | distancePlan  | Number   | The distance the user want to run 5k, 15k, Half- Marathon|
   | experienceRunning| Number   | Users previous running expereince|
   | difficultyRun | Number    | How fast the user wants to finish the workout plan|

### Networking
#### List of network requests by screen
   - Home Feed Screen
      - (Read/GET) Query all posts where user is author
         ```swift
         let query = PFQuery(className:"WorkOut")
         query.whereKey("author", equalTo: currentUser)
         query.order(byDescending: "createdAt")
         query.findObjectsInBackground { (posts: [PFObject]?, error: Error?) in
            if let error = error { 
               print(error.localizedDescription)
            } else if let posts = posts {
               print("Successfully retrieved \(posts.count) posts.")
           // TODO: Do something with posts...
            }
         }
         ```
      - (Create/POST) Create a new note for the day
      - (Delete) Delete existing note
      - (Create/POST) Add adittional event for the week
      - (Delete) Delete existing event
      - (Create/POST) Add a buttin that confirms id user did workout
      - (Delete) Reverse action 
   - Create Post Screen
      - (Create/POST) Create a new Workout object
   - Profile Screen
      - (Read/GET) Query logged in user object
      - (Update/PUT) Update user profile image


# Final Product - Running Mate

**Running Mate** The app implements FSCalendar and Parse Dashboard to create a customized workout plan created from the users preference. Once the workout plan is created their home page consists of an overview of users activity and progress. The user can also customize their home view by being able to change their  profile image and create their own personal message. All together the app will be used for users to start a running regime in which the app will organize your workouts in your calendar and the user will visually be able to see their progress throughout their workout plan.

Time spent: **120** hours spent in total researching and working on the app

## User Stories

The following  is the **required** functionality I had set for my project:

**Required Must-have Stories**
- [x] Setting up our wireframe and skeleton view
- [x] Creating a Log in screen and having a logout butoon
- [x] User can create a new profile
- [x] Establishing a Parse Data base for the project
- [x] Creating and setting up the home screen
- [x] Add camera usage for profile picture
- [x] Have user set goals and prefereneces
- [x] Create an algorithm that receives user preferences and customizes user workout plan.
- [x] Create a function that would query the necessary information needed for the stream view and FSCalendar SDK
- [x] Also have labels that shows this weeks goals and activity in home stream
- [x] Creating a Tab bar to acess ti three total tabs
- [x] Use FSCalander Framework to create calander in calander tab
- [x] Establish the settings tab
- [x] Set notifications to remind user of workouts
- [x] Be able to properly tranistion throughout all screens.
- [x] Have all 3 Tabs to interacts sommothly
- [x] Fix UI and implement an external library.
- [x] Incorporate animations and gestures

The following **optional** features are implemented:

- [x] Decorate and made the UI look great - Created my own logos, assets, and color scheme to decorate the UI. I also used view containers to apply shadows to various objects to improve the appearence to the user.
- [x] Add additional features to Calendar - User UI was imporved and also the User has the ability to mark they finished a workout. When user marks they finished a workout they also recieve "congrats" alert.
- [ ] Creating a detail view controller for Notifications
- [ ] Implementing Notifications
- [ ] User can create an invent directly from the calendar.
- [ ] Use an API which retreives all nearby races and be able to create an event in FSCalendar.

## Video Walkthroughs
Here's a walkthrough of implemented user stories:

# Login / Sign Up
<img src='http://g.recordit.co/aysTVhBcdS.gif' title='Login / Signup Walkthrough' width='' alt='Log In Walkthrough' />

# Home tab
<img src='http://g.recordit.co/FPS1iDKIyw.gif' title='Login / Signup Walkthrough' width='' alt='Home Tab Walkthrough' />

# Calendar Tab
<img src='http://g.recordit.co/vjotoeGB4Z.gif' title='Calendar Tab' width='' alt='Calendar Walkthrough' />

# Settings Tab
<img src='http://g.recordit.co/1JbVbpHCV3.gif' title='Setings Tab' width='' alt='Settings Walkthrough' />


GIF created with [Record it]

## Credits

List an 3rd party libraries, icons, graphics, or other assets you used in your app.

- [Parse]
- [Cocoa Pods] - Pods I installed for app are 'FSCalendar', 'Parse', 'Parse UI', and 'SCLAlertView-Objective-C'.
- [Frameworks] - UIKit Framework and User Notification Framwork.


## Notes
This week went by a lot smoother than the previous week although their are still things I need to imrove on. Such as being consistant in 
editing my code while making progress, being more on top of my commit and pushes to github, and continue improving on the skills 
I developed as their is still room for imrovement.

## License

    Copyright [2020] [Denzel Tovar]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
