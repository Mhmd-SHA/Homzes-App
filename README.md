Homzes App
Overview
Homzes is a modern mobile application built with Flutter, designed to help users find and explore rental and sale properties. The platform provides an intuitive interface for browsing property listings, searching, and managing favorites, leveraging Firebase for backend services and BLoC for state management. It follows Clean Architecture principles for maintainability and scalability.

Features
Browse featured and new property listings with detailed information and high-quality images.
Search for properties using a user-friendly search bar.
View detailed property information, including location, price, beds, and bathrooms.
Mark properties as favorites with a heart icon.
Navigate between screens with smooth slide animations.
Real-time data synchronization using Firebase Firestore and Storage.
Responsive design for mobile devices.
Tech Stack
Flutter: Cross-platform framework for building the UI.
Firebase:
Firestore: For real-time database management of properties.
Storage: For hosting and serving property images.
Authentication: For user authentication (optional, if implemented).
BLoC: For state management following Clean Architecture.
GoRouter: For declarative navigation with custom transitions.
Google Fonts: For consistent typography (Roboto Flex).
Dart: The programming language for Flutter.
Project Structure
text

Collapse

Unwrap

Copy
Homzes-App/
├── lib/                  # Flutter Dart code
│   ├── core/             # Utilities (e.g., colors, widgets, inject)
│   │   ├── config/       # Configuration files (e.g., app_colors.dart)
│   │   ├── widgets/      # Reusable widgets (e.g., buttons.dart)
│   │   └── inject.dart   # Dependency injection
│   ├── feature/          # Feature-specific code
│   │   └── home/         # Home feature
│   │       ├── data/     # Data sources and repositories
│   │       ├── domain/   # Entities and use cases
│   │       ├── presentation/ # BLoC, screens, and widgets
│   │       └── bloc/     # BLoC implementations
│   └── main.dart         # App entry point
├── assets/               # Static assets (e.g., images)
├── pubspec.yaml          # Flutter project configuration and dependencies
├── .gitignore            # Git ignore file
└── README.md             # Project documentation (this file)
Getting Started
Prerequisites
Before you begin, ensure you have the following installed:

Flutter SDK: Version 3.0.0 or higher (check flutter --version).
Dart: Included with Flutter.
Firebase CLI: For managing Firebase projects (npm install -g firebase-tools).
Android Studio/XCode: For Android/iOS development.
Git: For cloning the repository.
Installation
Clone the repository:
bash

Collapse

Unwrap

Copy
git clone https://github.com/Mhmd-SHA/Homzes-App.git
cd Homzes-App
Install dependencies:
bash

Collapse

Unwrap

Copy
flutter pub get
Set Up Firebase:
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
Run the App:
bash

Collapse

Unwrap

Copy
flutter run
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

Acknowledgements
Thanks to the Flutter and Firebase communities for their tools and documentation.
Inspiration from Figma designs and real estate app concepts.
