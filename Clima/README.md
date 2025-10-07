# 🌤️ Weather App (Coding Assessment)

## Overview
This project is a weather application built for the **Mobile Developer (Swift)** coding assessment. It allows users to search for any city and view live weather data using the **OpenWeather API**. The app demonstrates modern iOS development practices — including MVVM architecture, dependency injection, and clean code principles.

---

## ✨ Features
- **Splash Screen:** Displays briefly before loading the main interface.
- **City Search:** Enter a city name to fetch real-time weather data.
- **Weather Details Screen:** Shows temperature, condition description, and weather icon.
- **Favorites:** Save a favorite city — it’s automatically pre-filled on app launch.
- **Unit Conversion:** Toggle between °C and °F in the settings screen.
- **Dark/Light Theme Support:** Adapts to system appearance.

---

## 🧱 Architecture
The app is built using the **MVVM (Model-View-ViewModel)** pattern:
- **Model:** Handles data parsing and API responses from OpenWeather.
- **ViewModel:** Manages data flow between the model and UI, applies business logic.
- **View (Storyboard):** Displays data and handles user interactions.

---

## 💡 Technical Highlights
- **Language:** Swift  
- **UI:** Storyboards  
- **API:** [OpenWeather Current Weather Data](https://openweathermap.org/current)  
- **Architecture:** MVVM  
- **Dependency Injection:** Used to manage `WeatherService`, `UserPreferences`, and other shared components.  
- **Unit Tests:** Added for weather fetching and temperature conversion logic.  
- **SOLID Principles:** Applied to ensure scalability and maintainability.  
- **Lifecycle Management:** Demonstrates view controller initialization, data binding, and updates.

---

## ⚙️ Setup Instructions
1. Clone the repository:
   ```bash
   git clone https://github.com/<your-username>/<repo-name>.git
   cd <repo-name>
   ```
2. Open the project in **Xcode**.
3. Add your **OpenWeather API key** in `WeatherManager.swift`:
   ```swift
   let apiKey = "YOUR_API_KEY"
   ```
4. Build and run the app on a simulator or physical device.

---

## 🧪 Tests
Run unit tests via **Xcode > Product > Test**  
or use the CLI:
```bash
xcodebuild test -scheme WeatherApp -destination 'platform=iOS Simulator,name=iPhone 15'
```

---

## 📸 Screenshots
*(Optional — Add screenshots of your splash screen, search screen, and weather screen here.)*

---

## 🧍 Author
**Wisdom Iyamu**  
Mobile Developer — Swift & Flutter  
[LinkedIn](#) • [GitHub](#)
