# Swift Bootcamp Assignments

This repository contains my solutions for the Swift Bootcamp assignments.  
Each task focuses on a different concept in Swift, gradually increasing in difficulty.

## Assignments

### 📌 Assignment 1. – Variables, Data Types, Functions, and Closures
Personal info card; basic calculator; array filtering with closures.

### 📌 Assignment 2 – SwiftUI Layout: Profile Card
Profile image, name, info cards, "About Me", action buttons.

### 📌 Assignment 3 – Basic Counter with @State
Counter with increment and decrement buttons.

### 📌 Assignment 4 – MasterListApp with Sections and Navigation
MasterListApp is a SwiftUI task manager built using the **MVC pattern**. It loads tasks from JSON and UserDefaults, separating them into "To Be Completed" and "Completed Items". Tap a task to see its title, description, and SF Symbol. The app features dynamic background colors on view load and allows swipe-to-delete for tasks.

### 📌 Assignment 5 – Task Management App
This is a task manager built using **MVVM**. Users can add, delete, and toggle tasks. The UI updates reactively using @Published properties.

### 📌 Assignment 6 – Event Management App
This app lets users manage events by adding them through a modal form, viewing them in a list, checking full details, and deleting when needed. Each event includes a title, date, type, and an optional reminder, and the UI updates reactively with **MVVM**.

### 📌 Assignment 7 – Notes App (UserDefaults & Codable)
A Notes app developed using the **MVVM architecture** that permanently saves user-created notes using **UserDefaults** and Codable. Users can add, view, and optionally delete notes, each containing a title, content, and date. 

### 📌 Assignment 8 - Notes App (Core Data & CRUD)
A Notes app developed using the **MVVM architecture** with **Core Data** for persistence.
Users can add, view, delete, and edit notes, each containing a title, content, and date.
The project demonstrates the use of Core Data for local storage and full **CRUD** operations (Create, Read, Update, Delete).

### 📌 Assignment 9 - Weather App (URLSession & JSON Decode API)
This is a simple Weather App developed using **SwiftUI** and **MVVM architecture**.  
The app fetches real-time weather data from the **OpenWeather API** using `URLSession` and decodes the JSON response into Swift models with the **`Codable` protocol**.

### 📌 Assignment 10 – Rick and Morty Browser
A SwiftUI app using the Rick and Morty API with a **NetworkService** and **Core Data** for local favorites. Features character list, detail view, search, pull-to-refresh, infinite scroll, async/await, basic image caching, and MVVM architecture.


### 📌 Assignment 11 – Location-Based Map App (SwiftUI & CoreLocation)
This assignment focuses on building a location-based app using SwiftUI and CoreLocation. Users can:

- Grant location permission (While Using the App / Always).  
- See their current location updated live on a map with coordinates and reverse-geocoded address.  
- Add favorite locations via a button (markers appear on the map).  
- View a list of favorite locations in a separate Favorites screen.

### 📌 Assignment 12 – WaterTrackerApp
A SwiftUI app to track daily water intake using **SwiftData** for persistent storage. Features a main view showing cups drunk today, an interactive “+1 Glass” button, and a **WidgetKit** widget with **AppIntents** to add water directly from the widget. The app supports live sync between app and widget, and follows MVVM architecture.

