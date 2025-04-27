# DBIT Placement Portal

A Flutter application designed to streamline the placement process for students at Don Bosco Institute of Technology. This portal connects students with potential employers, provides information about upcoming placement drives, and allows students to apply for jobs directly through the app.

## Features

### Student Features
- **User Authentication**: Secure login and registration system
- **Profile Management**: Create and update student profiles with academic and personal information
- **Job Applications**: Apply for jobs directly through the app
- **Placement Statistics**: View placement statistics and trends
- **Company Information**: Browse through the list of companies visiting campus
- **Announcements**: Stay updated with important placement-related announcements

### Admin Features (Future Development)
- **Manage Placement Drives**: Add, update, or remove placement drives
- **Student Management**: View and manage student profiles and applications
- **Analytics Dashboard**: Track placement statistics and generate reports
- **Announcement Management**: Post important announcements for students

## Tech Stack

- **Frontend**: Flutter (Dart)
- **Backend**: Firebase (Authentication, Firestore, Storage)
- **State Management**: Provider/setState
- **Design Pattern**: MVVM (Model-View-ViewModel)

## Getting Started

### Prerequisites
- Flutter SDK (2.0 or higher)
- Dart SDK (2.12 or higher)
- Android Studio / VS Code
- Firebase account (for backend services)

### Installation

1. Clone the repository
```bash
git clone https://github.com/AustinDsza/placement_portal_flutter
```

2. Navigate to the project directory
```bash
cd dbit-placement-portal
```

3. Install dependencies
```bash
flutter pub get
```

4. Run the app
```bash
flutter run
```

### Firebase Setup

1. Create a new Firebase project at [Firebase Console](https://console.firebase.google.com/)
2. Add an Android app to your Firebase project
   - Package name: `com.example.placement_portal` (or your custom package name)
   - Download the `google-services.json` file and place it in the `android/app` directory
3. Add an iOS app to your Firebase project (if needed)
   - Bundle ID: `com.example.placementPortal` (or your custom bundle ID)
   - Download the `GoogleService-Info.plist` file and place it in the `ios/Runner` directory
4. Enable Authentication (Email/Password)
5. Create Firestore Database with appropriate security rules

## Project Structure

```
lib/
├── main.dart                  # Entry point of the application
├── firebase_options.dart      # Firebase configuration
├── screens/                   # UI screens
│   ├── home_screen.dart       # Home screen with placement drives
│   ├── login_page.dart        # Login screen
│   ├── registration_page.dart # User registration
│   ├── registration_form.dart # Student registration form
│   ├── job_application_form.dart # Job application form
│   ├── profile_page.dart      # User profile
│   ├── company_list.dart      # List of companies
│   ├── placement_statistics.dart # Placement statistics
│   └── about_us.dart          # About the institution
├── models/                    # Data models (to be implemented)
├── services/                  # Firebase and other services (to be implemented)
└── widgets/                   # Reusable UI components (to be implemented)
```

## Key Functionalities

1. **Login & Registration**: Users can create accounts and log in securely
2. **Home Screen**: Displays upcoming placement drives with "Apply Now" functionality
3. **Job Application**: Students can apply for jobs by filling out a detailed application form
4. **Profile Management**: Students can create and update their academic and personal profiles
5. **Placement Statistics**: Visual representation of placement data and trends

## Future Enhancements

- **Real-time Notifications**: Push notifications for new placement drives and updates
- **Chat Feature**: Direct communication between students and placement officers
- **Resume Builder**: Built-in tool to create and update resumes
- **Interview Scheduler**: Schedule and manage interview slots
- **Mock Tests**: Practice tests for aptitude and technical skills
- **Feedback System**: Collect and analyze feedback from students about the placement process

## Flutter Resources

For help getting started with Flutter development:
- [Flutter Documentation](https://docs.flutter.dev/)
- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

---

Developed for Don Bosco Institute of Technology
