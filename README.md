# Weather Application

## Overview

The Weather Application is a feature-rich iOS app providing real-time weather updates, detailed forecasts, and insights into tourist attractions in various cities. Built using Swift and SwiftUI, the app integrates CoreLocation and MapKit for precise geolocation services and the OpenWeatherMap API for accurate weather data. The intuitive UI and interactive navigation make it easy for users to explore weather and location-based details.

---

## Features

### Real-Time Weather
- Displays current weather conditions such as temperature, humidity, pressure, and wind speed.
- Users can search for weather data by entering city names.

### Hourly and Daily Forecasts
- Hourly forecasts with temperature, conditions, and icons for the next several hours.
- Daily forecasts showing high/low temperatures and weather conditions for the week.

### Tourist Places Map
- Map view showing tourist attractions in the selected city.
- Provides details about attractions, including names, descriptions, images, and links for further information.

### Interactive Navigation
- A tab-based interface for seamless switching between:
  - Current Weather (`WeatherNowView`).
  - Forecast (`WeatherForecastView`).
  - Tourist Map (`TouristPlacesMapView`).

---

## Technical Details

### Architecture and Technologies
- **Language**: Swift
- **Frameworks**:
  - **SwiftUI**: For building responsive and modern user interfaces.
  - **CoreLocation**: For geolocation and reverse geocoding.
  - **MapKit**: For displaying and managing maps.
- **API**: OpenWeatherMap API for weather data.

### Key Components
1. **`WeatherDataModel`**:
   - Represents the structure of weather data, including hourly and daily forecasts.

2. **`PlacesDataModel`**:
   - Defines the structure of tourist places, including names, coordinates, images, and descriptions.

3. **Views**:
   - **`WeatherNowView`**: Displays current weather and allows city searches.
   - **`WeatherForecastView`**: Provides hourly and daily forecasts in a user-friendly format.
   - **`TouristPlacesMapView`**: Interactive map of tourist attractions with detailed popups.
   - **`DailyWeatherView`**: Displays daily weather details with temperature ranges and conditions.

4. **Utilities**:
   - **`DateFormatterUtils`**: Formats timestamps into user-readable dates and times.
   - **`WindDirHelper`**: Converts wind directions into cardinal compass points.

5. **Navigation**:
   - **`NavBar`**: Manages navigation between main sections of the app.

### Data Handling
- **JSON Data**:
  - Weather data fetched via API is decoded using `WeatherDataModel`.
  - Tourist locations are stored and managed in `places.json`.

---

## How to Use

1. **Launch the App**:
   - The app starts with weather details for London.
2. **Search for a City**:
   - Use the search bar in the "City" tab to find weather details for any city.
3. **Explore Tourist Attractions**:
   - Navigate to the "Place Map" tab to view tourist attractions in the selected city.
4. **View Forecasts**:
   - Use the "Forecast" tab to explore hourly and daily weather predictions.

---

## Installation

1. Clone the repository:
   ```bash
   git clone <repository-link>
   ```
2. Open the project in Xcode.
 
3. Set your OpenWeatherMap API key in WeatherMapViewModel.swift:
swift
``` bash
let url = URL(string: "https://api.openweathermap.org/data/3.0/onecall?lat=\\(lat)&lon=\\(lon)&units=metric&appid=YOUR_API_KEY")
```
4. Build and run the project on an iOS device or simulator.



