# Soccer App Blueprint

## Overview

This document outlines the blueprint for a Flutter soccer application. The app allows users to browse a list of soccer players, view their detailed stats and reviews, and contribute by adding their own reviews. The application is integrated with Firebase Firestore for backend data storage and utilizes a modern, clean UI design.

## Features

*   **Player Directory:** Main screen displaying a scrollable list of soccer players.
*   **Detailed Player View:** A screen dedicated to each player, showing their image, stats, and user-submitted reviews.
*   **Review System:** Users can read reviews for each player and submit their own review with a rating.
*   **Ad Integration:** A sponsored ad banner is displayed on the home screen.
*   **Firebase Backend:** The app uses Firebase Firestore to store and retrieve player and review data.
*   **Custom Theming:** A unique and modern visual theme with custom fonts and colors.

## Project Structure

```
lib
├── api
│   └── firebase_api.dart
├── models
│   ├── player.dart
│   └── review.dart
├── screens
│   ├── ad_banner.dart
│   ├── add_review_screen.dart
│   ├── home_screen.dart
│   └── player_detail_screen.dart
├── utils
│   └── theme.dart
├── widgets
│   ├── player_card.dart
│   └── review_card.dart
└── main.dart
```

## Dependencies

*   `cloud_firestore`: For Firebase Firestore database interaction.
*   `firebase_core`: To initialize Firebase services.
*   `provider`: For state management and dependency injection.
*   `google_fonts`: For custom typography.
