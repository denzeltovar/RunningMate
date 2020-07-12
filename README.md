# True-life

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

* Creating a Log in screen and having a logout butoon
* Establishing a Parse Data base for the project
* Creating and setting up the home screen
* Add camera usage for profile picture
* Have user set goals and prefereneces
* Have entered information create a plan that is then sent to their calander
* Also have labels that shows this weeks goals and percantage of improvment from previous week
* Creating a Tab bar to acess two other tabs
* Use FSCalander Framework to create calander tab
* Establish the settings tab and creating a detail view controller for Notifications
* Set notifications to remind user of workouts
* Be able to properly tranistion throughout all screens.


**Optional Nice-to-have Stories**

* [Decorate and make the UI look great]
* [Add additional features to settings]
* [Add additional features to Goals]
*  Add an additional tab for "Events"
* Connect to Running API and be able to display local races
* Be able to search for races
* Have customizable filters for settings
* Be able to add event to calander

### 2. Screen Archetypes

* [Login & Setup]
   * [Accepting varying types of form input from user for basic login / signup]
   * [Validation of form inputs for invalid data (i.e bad emails, duplicate emails)]
   * [Integrating third-party connection SDKs (i.e Calander SDK)]
 
* [Streaming]
   * [Set up a navigation controller for the home page]
   * [Properly set up the layout in storyboard and create outlets]
   * [Have home page display total mileage completed since start of program, workout plan for the week, and the profile image of the user.]

* [Settings]
   * [Create a new view controller that will be connected though tabs.]
   * [Properly layout the story board and create it's outlets]
   * [Create cells for "notifications", "log out"and "about"]
   * [Each label will have it's own segue to a details view controller where it will allow the user to customize some prefrences, have details on how the app works, and give the user the ability to log out.]
 * [Goals]
   * [Create a new view controller that will be connected though tabs.]
   * [Properly layout the story board and create it's outlets]
   * [Create a label where it will allow you to create a note for the day]
   * [Allow user to customize goals for daily,weekly, and monthly purposes.]
   * [Be able to send notifications as reminders for upcoming workouts or events]
 

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* [Calander]
* [Goals]
* [Settings]

**Flow Navigation** (Screen to Screen)

* [Goals]
    * Set Goals
   
* [Calander]
   * [Notes]
   * [Todays goal]
   * [Add eevent]
* [Settings]
   * [Notifications about General Settings]
   * [About page]
   * Log Out
   
   
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
   | didFinishRun  | Bool.    | For when the user marks they have finished the workout|
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


