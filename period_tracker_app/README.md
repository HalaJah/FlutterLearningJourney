# Period Tracker Mobile Application
This repository contains the source code for a Period Tracker mobile application developed using Flutter. The application is designed to assist users in tracking their menstrual cycles, offering predictions for fertile windows for conceiving, and providing a comprehensive view of period history. Users can also add notes to track their moods, blood flow, and other related insights.

# Key Features:
Menstrual Cycle Tracking: Easily log the start and end dates of periods (completed).<br />
Fertility Predictions: Get insights on potential fertile windows for conceiving (uder development).<br />
Period History: Review past menstrual cycles to understand patterns (uder development).<br />
Mood & Symptoms Logging: Add notes about daily moods, blood flow intensity, and any other symptoms or observations (completed).


# Development Status:
Firebase Integration: Work is currently in progress to integrate Firebase for back-end database management. This will allow for secure storage, retrieval, and management of user data. <br />
UI Enhancements: Upcoming updates include adding hover effects and refining the frontend experience to make the application more user-friendly.

# App Pages: 
**Loading Page:**

The loading page features animations of a heart and a cat

<img src= "https://github.com/HalaJah/FlutterLearningJourney/blob/main/period_tracker_app/UI/Loading.jpg" width = 200 height = 350 />

**Home Page:**

The Homepage features two horizontally-scrollable cards that display the fertile date and the next period start date. One of these cards includes a button that, when pressed, presents a calendar dialog to select the start and end dates. These dates are then displayed both on the calendar and on the profile page. Additionally, the homepage contains cards that navigate users to other pages. These cards are animated when double tapped. 

<table>
  <tr>
    <td><img src="https://github.com/HalaJah/FlutterLearningJourney/blob/main/period_tracker_app/UI/Home1.jpg" width=200 height=350></td>
    <td><img src="https://github.com/HalaJah/FlutterLearningJourney/blob/main/period_tracker_app/UI/Home2.jpg" width=200 height=350></td>
    <td><img src="https://github.com/HalaJah/FlutterLearningJourney/blob/main/period_tracker_app/UI/Home3.jpg" width=200 height=350></td>
    <td><img src="https://github.com/HalaJah/FlutterLearningJourney/blob/main/period_tracker_app/UI/Home4.jpg" width=200 height=350></td>
  </tr>
</table>

**Profile Page:**

In the profile page, users input their period information, including the start date, end date, and cycle days. The dates are entered using an animated plus button that reveals a calendar dialog. Meanwhile, the cycle days are input via a text field located in the second card.

<table>
  <tr>
    <td><img src="https://github.com/HalaJah/FlutterLearningJourney/blob/main/period_tracker_app/UI/Profile2.jpg" width=200 height=350></td>
    <td><img src="https://github.com/HalaJah/FlutterLearningJourney/blob/main/period_tracker_app/UI/Profile1.jpg" width=200 height=350></td>
  </tr>
</table>

**Journal Page:**

The journal page features pop-up cards. When a user clicks on one of these cards, they can select mood, flow, and drinking water options. The chosen details will then be displayed on the Calendar page. Additionally, a slide-out pop-up will appear, allowing the user to input a note. This note will also be visible on the Calendar page and can be edited at a later time.

<table>
  <tr>
    <td><img src="https://github.com/HalaJah/FlutterLearningJourney/blob/main/period_tracker_app/UI/Journal1.jpg" width=200 height=350></td>
    <td><img src="https://github.com/HalaJah/FlutterLearningJourney/blob/main/period_tracker_app/UI/Journal2.jpg" width=200 height=350></td>
    <td><img src="https://github.com/HalaJah/FlutterLearningJourney/blob/main/period_tracker_app/UI/Journal3.jpg" width=200 height=350></td>
    <td><img src="https://github.com/HalaJah/FlutterLearningJourney/blob/main/period_tracker_app/UI/Journal4.jpg" width=200 height=350></td>  
  </tr>
</table>
