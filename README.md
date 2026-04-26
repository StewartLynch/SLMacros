# SLMacros

`SLMacros` is a Swift package that provides two macros:

- `#URL("...")` for creating validated `Foundation.URL` values from string literals.
- `@CaseIdentifiable` for making an enum conform to `Identifiable` and generating a string-based `id`.

## Macros

### `#URL`

`#URL` is a freestanding expression macro that accepts a static string literal and returns a `URL`.

It validates the value at compile time and emits an error when:

- the argument is not a string literal
- the string is not a valid absolute URL

Example:

```swift
import Foundation
import SLMacros

let website = #URL("https://example.com")
```

This works well when you want URL values to be checked during compilation instead of failing later at runtime.

### `@CaseIdentifiable`

`@CaseIdentifiable` is an attached macro for enums. It:

- adds `Identifiable` conformance
- generates a `public var id: String`
- uses the enum case name as the identifier

Example:

```swift
import SLMacros

@CaseIdentifiable
enum Screen {
    case home
    case settings
    case profile(userID: Int)
}
```

The macro expands to behavior equivalent to:

```swift
extension Screen: Identifiable {}

extension Screen {
    public var id: String {
        switch self {
        case .home:
            "home"
        case .settings:
            "settings"
        case .profile:
            "profile"
        }
    }
}
```

The macro emits diagnostics when:

- it is applied to something other than an enum
- the enum has no cases
- the enum already conforms to `Identifiable`

## Adding `SLMacros` To An Xcode Project

You can install `SLMacros` in Xcode either from GitHub or by downloading the repository and adding it as a local package.

### Option 1: Install from GitHub

1. Open your app project in Xcode.
2. Choose `File > Add Package Dependencies...`
3. Enter the package URL:

```text
https://github.com/StewartLynch/SLMacros
```

4. Choose the dependency rule you want, such as the latest version or a branch.
5. Click `Add Package`.
6. Add the `SLMacros` library product to the target that will use the macros.

### Option 2: Download and add as a local package

1. Download or clone the repository from [github.com/StewartLynch/SLMacros](https://github.com/StewartLynch/SLMacros).
2. Open your app project in Xcode.
3. Choose `File > Add Package Dependencies...`
4. Click `Add Local...`
5. Select the downloaded `SLMacros` folder.
6. Add the `SLMacros` library product to the target that will use the macros.

Once the package has been added, Xcode will make the macros available to any target linked against the `SLMacros` product.

## Importing And Using The Macros

After adding the package to your target, import the module where you want to use the macros:

```swift
import Foundation
import SLMacros
```

Then use them like this:

```swift
import Foundation
import SLMacros

struct Link {
    let url = #URL("https://example.com")
}

@CaseIdentifiable
enum Route {
    case home
    case profile(userID: Int)
}
```

## Requirements

- Xcode with Swift macro support
- Swift 6 package tools as configured in [Package.swift](/Users/slynch/Downloads/SLMacros/Package.swift)
