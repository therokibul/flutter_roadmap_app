# Flutter Developer Roadmap 2025 App

A visually appealing and interactive Flutter application designed to showcase a clear roadmap for becoming a Flutter developer in 2025. This app was created to be presented at the "Roadmap to Becoming a Flutter App Developer in 2025" webinar.

**Last Updated:** July 5, 2025

![Flutter Roadmap App Screenshot](https://ibb.co/WWBCG1kx)

---

## 🚀 Features

* **Interactive Timeline:** A step-by-step list of milestones on the path to becoming a Flutter developer.
* **Progress Tracking:** Users can check off milestones they have completed.
* **Visual Progress Bar:** A linear progress indicator provides immediate feedback on completion percentage.
* **Detailed Information:** Each milestone has a dedicated details screen with a description and a list of helpful learning resources.
* **Clean & Modern UI:** A visually appealing and user-friendly interface built with Material Design principles.
* **Scalable Project Structure:** The code is organized into a clean and maintainable structure (models, screens, widgets) for easy understanding and future development.

---

## 📂 Project Structure

The project follows standard Flutter best practices to separate concerns and improve maintainability.

```
flutter_roadmap_app/
├── lib/
│   ├── main.dart                 # App entry point and theme setup
│   │
│   ├── models/
│   │   ├── milestone_model.dart  # Data model for a single milestone
│   │   └── resource_model.dart   # Data model for a learning resource
│   │
│   ├── screens/
│   │   ├── roadmap_screen.dart   # Main screen with the milestone list
│   │   └── milestone_details_screen.dart # Screen for milestone details
│   │
│   └── widgets/
│       └── milestone_tile.dart   # Reusable UI for a single milestone item
│
├── pubspec.yaml                  # Project dependencies and assets
└── README.md                     # This file
```

---

## ⚙️ Getting Started

Follow these instructions to get a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

* [Flutter SDK](https://flutter.dev/docs/get-started/install) (Channel stable, 3.x.x or later)
* [Dart SDK](https://dart.dev/get-dart)
* A code editor like [VS Code](https://code.visualstudio.com/) with the Flutter extension or [Android Studio](https://developer.android.com/studio).

### Installation

1.  **Clone the repository:**
    ```sh
    git clone <your-repository-url>
    ```
2.  **Navigate to the project directory:**
    ```sh
    cd flutter_roadmap_app
    ```
3.  **Install dependencies:**
    ```sh
    flutter pub get
    ```
4.  **Run the app:**
    ```sh
    flutter run
    ```
    You can also select your target device and run it from your IDE.

---

## 📝 To-Do / Future Enhancements

* [ ] Add state persistence so that the user's progress is saved between app sessions.
* [ ] Implement animations for a more engaging user experience.
* [ ] Add custom fonts like 'Inter' to the `pubspec.yaml` and asset folders.
