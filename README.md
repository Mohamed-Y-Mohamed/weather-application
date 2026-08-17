# Weather Application

This repository contains a SwiftUI iOS weather application built from an Xcode coursework template. It retrieves weather data for a city, displays current/hourly/daily forecast views and includes a map of tourist places from bundled location data.

## Features

- Geocode a city name with Core Location.
- Retrieve weather data from the OpenWeather One Call API.
- Display current, hourly and daily weather information.
- Show weather details including temperature, humidity, pressure and wind information.
- Display tourist places on a MapKit map using bundled JSON and image assets.
- Start with London as the default city.

## Tech stack

| Layer | Technology |
|---|---|
| Language | Swift |
| UI | SwiftUI |
| Maps | MapKit |
| Location | CoreLocation |
| Networking | URLSession |
| Project | Xcode |

## Requirements

- macOS with Xcode.
- An iOS Simulator or compatible iOS device.
- An OpenWeather API key with access to the API endpoint used by the project.

## Installation

```bash
git clone https://github.com/Mohamed-Y-Mohamed/weather-application.git
cd weather-application
```

Open `CWK2Template.xcodeproj` in Xcode and run the application from the selected simulator or device.

## Configuration

The current source embeds an OpenWeather API key directly in `CWK2Template/ViewModels/WeatherMapViewModel.swift`.

That should not be treated as safe configuration. Rotate the exposed key in the OpenWeather account and move the replacement out of committed source before using the project further.

## Testing

No dedicated application test target or test source files were found in the repository tree, so no automated test command is documented.

## Licence

No new repository-wide licence is applied automatically.

Several source files identify the project as a coursework template and include another author's header. That is enough third-party/provenance uncertainty to avoid relicensing the entire repository without first confirming which parts were supplied as template code and what terms apply to them.
