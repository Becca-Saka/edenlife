# Eden Tracker

## Welcome to Eden Tracker

Eden Tracker is a demo tracking app built with [Ably Realtime](https://ably.com/), [Firebase Auth](https://pub.dev/packages/firebase_auth), and [Google](https://pub.dev/packages/google_sign_in) and [GitHub](https://github.com/Becca-Saka/github_signin_aksoyhlc) sign-in .

### Features:

- Sign-in with Google and GitHub accounts with Firebase auth.
- Real-time tracking functionality powered by Ably.

### Videos:
| Sign In with Google |Sign In with GitHub |
| - | - |
| [![Google](https://github.com/)](link_to_video) |[![GitHub](https://github.com/)](link_to_video) |

| Handling Errors | Empty Screen | Tracking Flow Screen|
| - | - |  - |
| [![Error](https://github.com/)](link_to_video) |[![Empty](https://github.com/)](link_to_video) |[![Track](https://github.com/)](link_to_video) |

### Mock Data:

The app automatically mocks data by sending mock data to Ably and listening to it via the `sendFakeData` method in the `OrderProvider` class.

### Want to Signout?
Click on the profile image at the top right corner.

[![Sign out](link_to_video)]
  
### Testing:

The app is thoroughly tested to ensure reliability and stability.

## Getting Started:

To get started with Eden Tracker, follow these steps:

1. Clone the repository.
2. Install dependencies using `flutter pub get`.
3. Run the app with `flutter run  --dart-define-from-file .env`
4. Select your preferred device or emulator.
5. Or Run via the already defined vscode `launch.json` file


