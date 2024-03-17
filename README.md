# Chat Sample by Action Cable

## Description
An example implementation of an inquiry chat feature using Action Cable.

## Technology Stack
- Framework: Rails 5.2.4
- Backend: Ruby 2.5.1
- Frontend: HTML,CSS,Javascript
- Database: MySQL
- Deployment: -

## Features
- Article Listing: Users can view a list of articles or spots.
- Inquiry Chat on Article: Users can initiate and engage in inquiry chats related to specific articles or spots.
- User (Admin) Inquiry Overview: Admin users can view a list of all inquiries.
- Real-time Chat Communication: Utilizing Action Cable for real-time communication between users and admins.

## Setup
```
rails db:seed
```

## Page URLs

Article Listing
```
http://localhost:3000/spots
```

Individual Article Inquiry Chat Page
```
http://localhost:3000/spots/1
```

User (Admin) Side Inquiry Listing
```
http://localhost:3000/users
```