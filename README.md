# Medicine Reminder App

A Flutter application that allows users to add daily medicines and receive scheduled reminders via notifications.

## Features
- Add medicines with name, dose, and time
- Sorted medicine list by scheduled time
- Daily notification reminders (background supported)
- Local storage using Hive
- Clean architecture with Provider state management

## Tech Stack
- Flutter
- Provider
- Hive
- flutter_local_notifications
- timezone
- Intl

## Notes
- Notifications use exact scheduling to comply with Android 12+ policies.
- No backend is used; all data is stored locally using Hive Boxes.

## How to Run
To run the apk on your android device, Download the application from release tab

## Clone This Project
To run it on your system
flutter pub get  
flutter run
