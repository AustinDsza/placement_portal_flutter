# DBIT Placement Portal

A modern Flutter-based placement portal application for Don Bosco Institute of Technology, designed to streamline the placement process and connect students with potential employers.

![DBIT Placement Portal](assets/images/app_preview.png)

## 🚀 Features

### Student Features
- **Secure Authentication**: Email/password based login system
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

## 🛠️ Tech Stack

- **Frontend**: Flutter (Dart)
- **Backend**: Firebase
  - Authentication
  - Firestore Database
  - Cloud Storage
- **State Management**: Provider/setState
- **Design Pattern**: MVVM (Model-View-ViewModel)

## 📋 Prerequisites

Before you begin, ensure you have the following installed:
- Flutter SDK (2.0 or higher)
- Dart SDK (2.12 or higher)
- Android Studio / VS Code
- Firebase account (for backend services)

## 🔧 Installation

1. Clone the repository
```bash
git clone https://github.com/AustinDsza/placement_portal_flutter
```

2. Navigate to the project directory
```bash
cd placement_portal
```

3. Install dependencies
```bash
flutter pub get
```

4. Run the app
```bash
flutter run
```

## 🔥 Firebase Setup

1. Create a new Firebase project at [Firebase Console](https://console.firebase.google.com/)
2. Add an Android app to your Firebase project
   - Package name: `com.example.placement_portal`
   - Download the `google-services.json` file and place it in the `android/app` directory
3. Add an iOS app to your Firebase project (if needed)
   - Bundle ID: `com.example.placementPortal`
   - Download the `GoogleService-Info.plist` file and place it in the `ios/Runner` directory
4. Enable Authentication (Email/Password)
5. Create Firestore Database with appropriate security rules

## 📁 Project Structure

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
├── models/                    # Data models
├── services/                  # Firebase and other services
└── widgets/                   # Reusable UI components
```

## 🎯 Key Functionalities

1. **User Authentication**
   - Secure login and registration
   - Password reset functionality
   - Session management

2. **Student Dashboard**
   - View upcoming placement drives
   - Apply for jobs
   - Track application status
   - View placement statistics

3. **Profile Management**
   - Academic details
   - Personal information
   - Skills and achievements
   - Resume upload

4. **Company Information**
   - Company profiles
   - Job descriptions
   - Application deadlines
   - Selection criteria

## 🔮 Future Enhancements

- [ ] Real-time Notifications
- [ ] Chat Feature
- [ ] Resume Builder
- [ ] Interview Scheduler
- [ ] Mock Tests
- [ ] Feedback System
- [ ] Admin Dashboard
- [ ] Analytics Reports

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👥 Team

- [Austin Dsza](https://github.com/AustinDsza) - Lead Developer

## 🙏 Acknowledgments

- Flutter Team
- Firebase Team
- DBIT Placement Cell
- All contributors and supporters

---

Developed for Don Bosco Institute of Technology
