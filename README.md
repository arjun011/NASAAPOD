# 📱 NASAAPOD iOS App

An iOS application that displays NASA’s **Astronomy Picture of the Day (APOD)** with support for browsing by date, caching, and modern Swift architecture.

---

## ✨ Features

- 📅 **Today Tab**
  - Displays today’s APOD (image/video, title, explanation)

- 🔍 **Browse Tab**
  - Select any past date using DatePicker
  - Loads APOD for selected date

- 🎬 **Media Support**
  - Image display using `AsyncImage`
  - Video support using `WKWebView`

- 💾 **Caching**
  - Last successful API response is cached
  - Automatically shown when API fails
  - UI clearly indicates cached data

- ⚡ **Modern Concurrency**
  - Built using `async/await`

- 🧪 **Unit Testing**
  - Implemented using **Swift Testing framework**
  - Mock-based architecture for testability

---

## 📸 Screenshots

Screenshots/today.png
Screenshots/browse.png
Screenshots/videoPlay.png
Screenshots/error.png

## 🏗 Architecture

The project follows **MVVM + Repository pattern** with clean separation of concerns:


## 📱 Requirements

- iOS 18+


## 📌 Notes

- No third-party libraries used
- Focus on clean architecture, testability, and scalability

---

## 👨‍💻 Author

Arjun Patel


