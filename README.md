# SwiftUI Clean Architecture

This is a SwiftUI app with Clean Architecture. 

<img src="https://miro.medium.com/v2/resize:fit:720/format:webp/1*uvrsXX8w-zwwCbKqF_T_SA.png" width="300" />

It uses [PokeAPI](https://pokeapi.co/) for the Pokemon list and details.

## Clean Architecture Diagram

![Clean Architecture Diagram](https://github.com/adhafajri/SwiftUI-Clean-Architecture/assets/43733851/86e209a6-b937-4e5b-a307-c9618889b50d)

- Data: This is where we do all data-related stuff, like databases, external APIs, etc.
- Domain: The business logic and rules, the app's functionalities, are all in this layer.
- Presentation: This layer will consist of everything related to the UI or whatever is displayed to the users.
- App: This is the layer if we wanna put stuff like AppDelegate, SceneDelegate, or our @main struct.
- Core: This layer contains app-wide shared code like utility functions, constants, and extensions. The above layers can be used, but you should not depend on them.

Check out the more detailed explanation on my ![Medium](https://medium.com/@adha_fajri/clean-architecture-in-swiftui-b184e0e687f8)
