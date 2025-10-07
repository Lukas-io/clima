# 🌤️ Weather App (Coding Assessment)

## Overview
This project is a weather application built for the **Mobile Developer (Swift)** coding assessment. It allows users to search for any city and view live weather data using the **OpenWeather API**. The app demonstrates modern iOS development practices — including MVVM architecture, dependency injection, and clean code principles.

---

## ✨ Features
- **City Search:** Enter a city name to fetch real-time weather data.
- **Weather Details Screen:** Shows temperature, condition description, and weather icon.
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
- **Dependency Injection:** Used to manage  `UserPreferences` for the temperature.  
- **SOLID Principles:** Applied to ensure scalability and maintainability.  

---

## ⚙️ Setup Instructions
1. Clone the repository:
   ```bash
   git clone https://github.com/Lukas-io/clima.git
   cd <repo-name>
   ```
2. Open the project in **Xcode**.
3. Add your **OpenWeather URL** in `WeatherManager.swift`:
   ```swift
   let url = "YOUR_WEATHER_URL"
   ```
4. Build and run the app on a simulator or physical device.

## 📸 Screenshots
<img width="1206" height="2622" alt="Simulator Screenshot - iPhone 17 Pro - 2025-10-07 at 13 16 25" src="https://github.com/user-attachments/assets/d6563fd9-b915-4a03-a5ab-863d5ee669b0" />

---

## 🧍 Author
**Wisdom Iyamu**  
Mobile Developer — Swift & Flutter  
www.linkedin.com/in/lukasio
