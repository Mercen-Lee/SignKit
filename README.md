![SignKit](https://raw.githubusercontent.com/Mercen-Lee/SignKit/main/Resources/SignKitLogo.svg)

![Swift](https://img.shields.io/badge/Swift-5.5_5.6_5.7_5.8-Orange?style=flat-square)
![Platforms](https://img.shields.io/badge/Platforms-iOS-yellowgreen?style=flat-square)
![Swift Package Manager](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange?style=flat-square)
![License](https://img.shields.io/badge/License-MIT-blue?style=flat-square)

SignKit is **easy session keeper** for JWT-based service.

## Requirements
| Platform | Minimum Swift Version | Installation |
| --- | --- | --- |
| iOS 11.0+ | 5.5 | [Swift Package Manager](#swift-package-manager) |

## Installation
### Swift Package Manager
- `File` -> `Add Packages...` And paste the repository URL.
- Or add it to the `dependencies` value of your `Package.swift`.
```swift
dependencies: [
  .package(url: "https://github.com/Mercen-Lee/SignKit.git", .branch("main"))
]
```

## Usage
- **Login**
```swift
Sign.login(
    id: id,
    password: password,
    accessToken: accessToken,
    refreshToken: refreshToken
)
```
- **Logout**
```swift
Sign.logout()
```
- **Reissue AccessToken**
```swift
Sign.reissue(accessToken)
```
- **Check is Logged In**
```swift
let isLoggedIn = Sign.isLoggedIn
```
