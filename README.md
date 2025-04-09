
[![Download App](https://img.shields.io/badge/Download-App-blue.svg)](https://github.com/Mhmd-SHA/Homzes-App/releases/latest](https://github.com/Mhmd-SHA/Homzes-App/releases/download/V1.1.0/Homzes.App-release.apk))
[![Download App](https://img.shields.io/badge/Download-App-blue.svg)](https://github.com/Mhmd-SHA/Homzes-App/releases/latest](https://github.com/Mhmd-SHA/Homzes-App/releases/download/V1.1.0/Homzes.App-release.apk))

![Screenshot from 2025-03-06 00-15-08](https://github.com/user-attachments/assets/3c8c135f-7426-4c7e-9bd4-fe5e68ee116d)
![Screenshot from 2025-03-06 00-16-29](https://github.com/user-attachments/assets/536c752d-a84c-45ce-ae7d-4bbe64cc07e1)
![Screenshot from 2025-03-06 00-18-17](https://github.com/user-attachments/assets/15727dd1-2ada-48bd-a012-fa04ed4d6c4c)


![Screenshot from 2025-03-06 00-15-08](https://github.com/user-attachments/assets/3c8c135f-7426-4c7e-9bd4-fe5e68ee116d)
![Screenshot from 2025-03-06 00-16-29](https://github.com/user-attachments/assets/536c752d-a84c-45ce-ae7d-4bbe64cc07e1)
![Screenshot from 2025-03-06 00-18-17](https://github.com/user-attachments/assets/15727dd1-2ada-48bd-a012-fa04ed4d6c4c)


# Homzes App

## Overview
Homzes is a modern mobile application built with Flutter, designed to help users find and explore rental and sale properties. The app features a clean, intuitive interface for browsing properties, searching, and managing favorites, leveraging Firebase for backend services and BLoC for state management. It follows Clean Architecture principles for maintainability and scalability.

## Features
- Browse featured and new property listings.
- Search for properties with a user-friendly search bar.
- View detailed property information, including images, location, price, beds, and bathrooms.
- Mark properties as favorites with a heart icon.
- Navigate between screens with smooth slide animations.
- Real-time data synchronization using Firebase Firestore and Storage.
- Responsive design for mobile devices.

## Technologies Used
- **Flutter**: Cross-platform framework for building the UI.
- **Firebase**:
  - Firestore: For real-time database management of properties.
  - Storage: For hosting and serving property images.
  - Authentication: For user authentication (optional, if implemented).
- **BLoC**: For state management following Clean Architecture.
- **Google Fonts**: For consistent typography (Roboto Flex).
- **Dart**: The programming language for Flutter.

## Prerequisites
Before you begin, ensure you have the following installed:

- Flutter SDK: Version 3.0.0 or higher (check `flutter --version`).
- Dart: Included with Flutter.
- Firebase CLI: For managing Firebase projects (`npm install -g firebase-tools`).
- Android Studio/XCode: For Android/iOS development.
- Node.js: For Firebase CLI (optional, if deploying Firebase rules).
- Git: For cloning the repository.

## Project Structure

```
Homzes-App/
├── client/                            # Flutter application
│   ├── android/                       # Android-specific files
│   ├── ios/                           # iOS-specific files
│   ├── lib/                           # Dart source code
│   │   ├── core/                      # Core utilities
│   │   │   ├── app_colors.dart        # App color constants
│   │   │   └── home_di.dart           # Dependency injection
│   │   ├── data/                      # Data layer
│   │   │   ├── home_data_source.dart  # Firebase data sources
│   │   │   └── home_repository_impl.dart # Repository implementations
│   │   ├── domain/                    # Domain layer
│   │   │   ├── entities/              # Business models
│   │   │   │   └── property.dart      # Property entity
│   │   │   └── usecases/              # Business logic
│   │   │       └── fetch_properties.dart # Use case for fetching properties
│   │   ├── presentation/              # Presentation layer
│   │   │   ├── bloc/                  # BLoC state management
│   │   │   │   └── home_bloc.dart     # Home screen BLoC
│   │   │   ├── screens/               # App screens
│   │   │   │   ├── welcome_screen.dart # Welcome screen
│   │   │   │   ├── home_screen.dart   # Home screen
│   │   │   │   └── search_catalog_3.dart # Search catalog screen
│   │   │   └── widgets/               # Reusable UI components
│   │   │       ├── buttons.dart       # Button components
│   │   │       └── service_card_widget.dart # Service card widget
│   │   └── main.dart                  # App entry point
│   ├── pubspec.yaml                   # Flutter dependencies
│   └── assets/                        # App assets (images, fonts)
├── server/                            # Backend services (Firebase)
│   ├── firestore/                     # Firestore configurations
│   │   └── rules/                     # Firestore security rules
│   └── storage/                       # Firebase Storage configurations
│       └── rules/                     # Storage security rules
├── .gitignore                         # Git ignore file
├── firebase.json                      # Firebase configuration
└── README.md                          # Project documentation (this file)
```

## Installation

### 1. Clone the Repository
```bash
git clone https://github.com/Mhmd-SHA/Homzes-App.git
cd Homzes-App
```

### 2. Install Dependencies
Run the following command to install Flutter dependencies:
```bash
cd client
flutter pub get
```

### 3. Set Up Firebase
- Create a Firebase project in the Firebase Console.
- Enable Firestore and Storage in your Firebase project.
- Download the google-services.json (Android) and GoogleService-Info.plist (iOS) files and place them in the appropriate directories:
  - Android: client/android/app/
  - iOS: client/ios/Runner/


### 4. Run the App
Run the app on an emulator or physical device:
```bash
cd client
flutter run
```

## Usage
- Launch the app to see the WelcomeScreen with property listings and service cards (Rent, Buy, Sell).
- Navigate to the HomeScreen (Search & Catalog 1) by tapping "Create an account" to browse featured and new property offers.
- Use the search bar to find properties, and tap "View all" to navigate to SearchCatalog3Screen with a slide animation.
- Interact with property cards, including marking favorites with the heart icon.

## Contributing
1. Fork the repository.
2. Create a new branch for your feature or bug fix:
   ```bash
   git checkout -b feature/your-feature-name
   ```
3. Make your changes and commit them:
   ```bash
   git commit -m "Add your commit message"
   ```
4. Push to the branch:
   ```bash
   git push origin feature/your-feature-name
   ```
5. Open a Pull Request on GitHub.

## License
This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments
- Thanks to the Flutter and Firebase communities for their tools and documentation.
- Inspiration from Figma designs and real estate app concepts.

## Contact
For questions or feedback, contact Mhmd-SHA or open an issue on GitHub.
