Homzes App
Overview
Homzes is a modern mobile application built with Flutter, designed to help users find and explore rental and sale properties. The app features a clean, intuitive interface for browsing properties, searching, and managing favorites, leveraging Firebase for backend services and BLoC for state management. It follows Clean Architecture principles for maintainability and scalability.

Features
Browse featured and new property listings.
Search for properties with a user-friendly search bar.
View detailed property information, including images, location, price, beds, and bathrooms.
Mark properties as favorites with a heart icon.
Navigate between screens with smooth slide animations.
Real-time data synchronization using Firebase Firestore and Storage.
Responsive design for mobile devices.
Technologies Used
Flutter: Cross-platform framework for building the UI.
Firebase:
Firestore: For real-time database management of properties.
Storage: For hosting and serving property images.
Authentication: For user authentication (optional, if implemented).
BLoC: For state management following Clean Architecture.
GoRouter: For declarative navigation with custom transitions.
Google Fonts: For consistent typography (Roboto Flex).
Dart: The programming language for Flutter.
Prerequisites
Before you begin, ensure you have the following installed:

Flutter SDK: Version 3.0.0 or higher (check flutter --version).
Dart: Included with Flutter.
Firebase CLI: For managing Firebase projects (npm install -g firebase-tools).
Android Studio/XCode: For Android/iOS development.
Node.js: For Firebase CLI (optional, if deploying Firebase rules).
Git: For cloning the repository.
Installation
1. Clone the Repository
bash

Collapse

Unwrap

Copy
git clone https://github.com/Mhmd-SHA/Homzes-App.git
cd Homzes-App
2. Install Dependencies
Run the following command to install Flutter dependencies:

bash

Collapse

Unwrap

Copy
flutter pub get
3. Set Up Firebase
Create a Firebase project in the Firebase Console.
Enable Firestore and Storage in your Firebase project.
Download the google-services.json (Android) and GoogleService-Info.plist (iOS) files and place them in the appropriate directories:
Android: android/app/
iOS: ios/Runner/
Configure Firebase Storage rules (optional, for public access during development):
json

Collapse

Unwrap

Copy
rules_version = '2';
service firebase.storage {
  match /b/{bucket}/o {
    match /{allPaths=**} {
      allow read: if request.auth != null; // Or allow public read for testing
      allow write: if request.auth != null;
    }
  }
}
Deploy rules using Firebase CLI:
bash

Collapse

Unwrap

Copy
firebase deploy --only storage
4. Set Up Environment Variables
If you use environment variables (e.g., for Firebase or API keys), create a .env file in the root directory and add your configuration. Ensure you ignore .env in .gitignore.

5. Run the App
Run the app on an emulator or physical device:

bash

Collapse

Unwrap

Copy
flutter run
Usage
Launch the app to see the WelcomeScreen with property listings and service cards (Rent, Buy, Sell).
Navigate to the HomeScreen (Search & Catalog 1) by tapping "Create an account" to browse featured and new property offers.
Use the search bar to find properties, and tap "View all" to navigate to SearchCatalog3Screen with a slide animation.
Interact with property cards, including marking favorites with the heart icon.
Project Structure
The app follows Clean Architecture:

Data Layer: Handles data sources (Firebase Storage, Firestore) and repositories (home_data_source.dart, home_repository_impl.dart).
Domain Layer: Contains entities (property.dart) and use cases (fetch_properties.dart).
Presentation Layer: Includes BLoC (home_bloc.dart), screens (welcome_screen.dart, home_screen.dart, search_catalog_3.dart), and widgets (buttons.dart, service_card_widget.dart).
Core: Utilities like colors (app_colors.dart) and dependency injection (home_di.dart).
Contributing
Fork the repository.
Create a new branch for your feature or bug fix:
bash

Collapse

Unwrap

Copy
git checkout -b feature/your-feature-name
Make your changes and commit them:
bash

Collapse

Unwrap

Copy
git commit -m "Add your commit message"
Push to the branch:
bash

Collapse

Unwrap

Copy
git push origin feature/your-feature-name
Open a Pull Request on GitHub.
License
This project is licensed under the MIT License - see the LICENSE file for details.

Acknowledgments
Thanks to the Flutter and Firebase communities for their tools and documentation.
Inspiration from Figma designs and real estate app concepts.
Contact
For questions or feedback, contact Mhmd-SHA or open an issue on GitHub.

Notes
Customization: Adjust the sections (e.g., Features, Prerequisites, Usage) to match your app’s specific functionality, design, or implementation details. For example, if you’ve added authentication, mention it under Features and Prerequisites.
Images: You can add screenshots or the Figma design image to the README by including Markdown like:
markdown

Collapse

Unwrap

Copy
![Homzes App Screenshot](path/to/screenshot.png)
Upload images to the assets/ directory or use a CDN and reference their URLs.
License: Create a LICENSE file in the repository root with the MIT License text (or your preferred license).
Dependencies: Ensure all dependencies listed in pubspec.yaml (e.g., firebase_core, cloud_firestore, firebase_storage, go_router, google_fonts, bloc) are documented or linked to their respective documentation.
Firebase Setup: The README assumes Firebase Storage and Firestore are used. If you use another CDN (e.g., Cloudinary), update the instructions accordingly.
GitHub Actions: If you have CI/CD workflows, you can mention them under Contributing or add a separate section for CI/CD setup.
