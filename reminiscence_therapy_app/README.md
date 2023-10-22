# Brain+ Project - Flutter

# Project description

**Overview:**

This is a mobile app designed for iOS devices. The app is 
focused on helping people with dementia engage in reminiscence 
therapy, which involves sharing memories to promote positive 
feelings and reduce stress. The app acts as a companion, 
enabling users to explore images related to their life, 
organized by different topics.

## Screens:

**1. Home Screen:**
- When the app is launched, it starts on the Home Screen.
- From here, users can navigate to other sections of the app.

**2. Choose a Topic Screen:**
- On the Choose a Topic Screen, users are presented with a list of different topics. 
- These topics include "My Childhood," "Food," "Art," and "Household Items."
- Users can select a specific topic of interest by tapping on it.

**3. View Images Screen:**
- After selecting a topic, users are taken to the View Images Screen.
- Here, users can view images related to the chosen topic.

## stack used
- Dart: programming language
- Flutter: framework for building the user interface and handling the app's logic
- Firebase (Firestore): for data storage.

## Cloud Service
- AWS S3 Bucket: for storing and serving topics' images.

## How to Run the App

To run the Reminiscence Therapy App, follow these simple steps:

1. **Clone this Repository:**
    - First, clone this GitHub repository to your local machine using Git. You can do this with the following command:
      ```
      git clone https://github.com/Elisha2605/flutter-app.git
      ```

2. **Install Dependencies:**
    - Navigate to the project directory in your terminal and install 
    - all the necessary dependencies using Flutter. Use the following command:
      ```
      flutter pub get
      ```

3. **Choose Data Source:**
    - You have two options for data sources:
        - **Firebase (Firestore):** Connect the app to Firestore. Make sure to configure 
            Firebase in your project. Replace the dummy data in 
            'choose_topic_screen.dart' with actual Firestore data.
         
        - In Firebase Firestore, create a 'topics' collection with documents for each topic. 
          Each document should have the following fields:
          - `name` (String): Name of the topic (e.g., "My Childhood," "Food," etc.).
          - `images` (List<String>): List of image URLs related to the topic.
      
        - **Hardcoded Dummy Data:** If you prefer not to use Firebase, you 
            can use the provided dummy data in 'choose_topic_screen.dart'.

4. **Run the App:**
    - You can launch the app by running the Flutter application with 
     the following command:
      ```
      flutter run
      ```

5. **Explore the App:**
    - Once the app is running, you can explore the Home Screen, 
      select topics, and view related images.