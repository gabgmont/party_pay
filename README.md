# PartyPay!

Partypay is an App that helps you to organize and calculate your check on restaurants, 
when sharing orders with other friends!

##UseCase

App consists in a session that is created with multiple users, and a restaurant. Orders can
be made from inside the session, and you can add new users after the session started. 
When anyone wants to make an order, they will select any other users on the table to share
that order, and its price will be automatically divided between them. During the session, 
the users inside can see a resume for their orders, and a general resume from the table,
that shows every item ordered by them, and by the other users including the individual value
per user, and the total value for that item.

##Api

The app uses an API to manage the sessions, users, and orders. 

-[PartyPay Api](http://partypay.herokuapp.com/swagger-ui.html)

##Design

The prototype from the app was designed using Figma, and has all the screens of the app.

-[Figma Prototype](https://www.figma.com/file/AZmnzcUVhgUo3rizPjnYcV/PartyPay!?node-id=0%3A1)

##Firebase Initialization

[FlutterFire Overview](https://firebase.flutter.dev/docs/overview)

###Generate android signing key

-[Flutter keystore and app signing docs](https://docs.flutter.dev/deployment/android)
