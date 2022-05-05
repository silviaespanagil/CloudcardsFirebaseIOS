# iOS: Studycards  
## _A firebase database and Auth exercise_

¡Hola mundo!

Until now and after doing a couple of apps, I haven't tried to do a login area. So, I decided to do a little Firebase course to learn to:
* Create Firebase databases
* Create the Auth 

The app is a simple CRUD with a custom database, where the user can write down a question that wants to study🤓. After answering the question, the user can click on the card that is going to flip, and there the answer will be displayed. Now the user can self evaluate:
-> 👍 Did it now the answer? Thumbs up! 
-> 👎 Didn't knew it? Thumbs down, and keep studying. When you come back you will see a message under the failed questions so you can try again.

<img src="https://user-images.githubusercontent.com/81619759/165967055-2108758b-7b9e-43e2-b168-7e674d323382.png" alt="" width="250"/>  <img src="https://user-images.githubusercontent.com/81619759/165967830-1214a910-cca8-4245-9276-672b70193562.png" alt="" width="250"/>  <img src="https://user-images.githubusercontent.com/81619759/165970769-3a2b9d6a-32a9-4dfe-8053-2f687970448f.png" alt="" width="250"/> 

## Some Requirements 📋

- Create a Firebase Database
- Get, add, remove and update data from the database
- Manage possible login messages such as wrong password, existing or unexisting user
- The user can login and logout
- The user can check the password while trying to login
- The user can add as many cards as wanted
- The user can delete the cards
- The user can self evaluate itself. If the user didn't knew the answer and click on thumbs down a message will be displayed in the card

## Built with 🔨

- XCode
- Swift
- SwiftUI
- Firebase

## Development ⌨️

### Cloud Firestore setup ☁️
I started adding Firebase into my app and after it the first step was to set up Cloud Firestore. Cloud Firestore allows you to create simple databases to store data, here you can add as much endpoints as you need and to create documents with different fields that should be typed. To check everything was allright and working properly I created the first document directly on the Firebase console.

### Managing of the database 👩🏽‍💻
As I said, I created the first database document directly on the Firebase console so first thing to do was to create a `getMethod` to call the database and try to render its content. This was like the confirmation that both the database and the Firebase integration into the app were right. 
With this working as expected, I added also an `add`, a`delete` and `update` methods, just to be able to do those actions directly from the app. 

### User authentication 🔒🪪
This is the first time I work with Authentication in one of my own apps. To do so I configured Firebase Authentication with an Email/Password login. With this the app changes a lot as you can't use it after actually logging in, the pro of this is that now the card creation is related to the user. So anyone that logs in can create, manage and delete its own cards. After the user finish using the app it can also logout.
<img width="472" alt="Screenshot 2022-05-05 at 11 25 22" src="https://user-images.githubusercontent.com/81619759/166905631-4023a877-968b-4329-b6c8-f8d66c28202e.png">

### Error feedback ❌
Until now if there's something wrong the user does not receive any alert, so, if an email is duplicated user can't create a new account but it doesn't know why. So, I added alerts so the user receive error feedback. 

<img width="263" alt="Screenshot 2022-05-05 at 12 36 42" src="https://user-images.githubusercontent.com/81619759/166907033-385399b6-a862-46db-98e4-549e03886f86.png"> <img width="259" alt="Screenshot 2022-05-05 at 12 36 18" src="https://user-images.githubusercontent.com/81619759/166907041-09318f3a-4cae-4896-871d-0060c86c386a.png">

## Check out the app in motion 👀🎬

https://user-images.githubusercontent.com/81619759/166910487-783b2897-9f2c-456e-b903-679b828d6af9.mov

## Want to fork this repo? 🐑

Feel free to fork my repo, but, if you want to learn a lot I recommend you to follow [this tutorial](https://www.raywenderlich.com/22029618-beginning-firebase-for-ios)
