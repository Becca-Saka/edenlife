# Eden Tracker

## Welcome to Eden Tracker

Eden Tracker is a demo tracking app built with [Ably Realtime](https://ably.com/), [Firebase Auth](https://pub.dev/packages/firebase_auth), and [Google](https://pub.dev/packages/google_sign_in) and [GitHub](https://github.com/Becca-Saka/github_signin_aksoyhlc) sign-in .

### Features:

- Sign-in with Google and GitHub accounts with Firebase auth.
- Real-time tracking functionality powered by Ably.

### Videos:
Full list of videos can be found here: [https://drive.google.com/drive/folders/1U5Xn-GXfleAcQW1cbCAxJ9pNSmwHqiz9?usp=sharing](https://drive.google.com/drive/folders/1U5Xn-GXfleAcQW1cbCAxJ9pNSmwHqiz9?usp=sharing)

| Sign In with Google |Sign In with GitHub |
| - | - |
| [![Google](https://github.com/Becca-Saka/edenlife/blob/master/screenrecord/google.gif?raw=true)](https://github.dev/Becca-Saka/edenlife)|[![GitHub](https://github.com/Becca-Saka/edenlife/blob/master/screenrecord/github.gif?raw=true)](https://github.dev/Becca-Saka/edenlife) |

| Handling Errors | Empty Screen | Tracking Flow Screen|
| - | - |  - |
| [![Error](https://github.com/Becca-Saka/edenlife/blob/master/screenrecord/error.gif?raw=true)](https://github.dev/Becca-Saka/edenlife)| [![Empty](https://github.com/Becca-Saka/edenlife/blob/master/screenrecord/emptystate.gif?raw=true)](https://github.dev/Becca-Saka/edenlife)|[![App Flow](https://github.com/Becca-Saka/edenlife/blob/master/screenrecord/appflow.gif?raw=true)](https://github.dev/Becca-Saka/edenlife) |

### Mock Data:

The app automatically mocks data by sending mock data to Ably and listening to it via the `sendFakeData` method in the `OrderProvider` class.

### Want to Signout?
Click on the profile image at the top right corner.

[![Sign out](https://github.com/Becca-Saka/edenlife/blob/master/screenrecord/signout.png?raw=true)](https://github.dev/Becca-Saka/edenlife)

  
### Testing:

The app is thoroughly tested to ensure reliability and stability.

## Getting Started:

To get started with Eden Tracker, follow these steps:

1. Clone the repository.
2. Install dependencies using `flutter pub get`.
3. Run the app with `flutter run  --dart-define-from-file .env`
4. Select your preferred device or emulator.
5. Or Run via the already defined vscode `launch.json` file


