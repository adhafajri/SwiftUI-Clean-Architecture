# SwiftUI Clean Architecture MVVM

This is a SwiftUI app with Clean Architecture + MVVM. 

<img src="https://miro.medium.com/v2/resize:fit:720/format:webp/1*uvrsXX8w-zwwCbKqF_T_SA.png" width="300" />

It uses [PokeAPI](https://pokeapi.co/) for the Pokemon list and details.

## Clean Architecture + MVVM Diagram

![Clean Architecture + MVVM Diagram](https://github.com/adhafajri/SwiftUI-Clean-Architecture/assets/43733851/008dde78-6340-4c67-b033-93c11ec8d951)

- Data: This is where we do all data-related stuff, like databases, external APIs, etc.
- Domain: The business logic and rules, the app's functionalities, are all in this layer.
- Presentation: This layer will consist of everything related to the UI or whatever is displayed to the users.
  -  Model: This represents the data and the business logic.
  -  ViewModel: This acts as the bridge between your view and your model. It holds the logic and processes them to be displayed by the View.
  -  View: This is where your UI is. The views will bind and display data from the ViewModel.
- App: This is the layer if we wanna put stuff like AppDelegate, SceneDelegate, or our @main struct.
- Core: This layer contains app-wide shared code like utility functions, constants, and extensions. The above layers can be used, but you should not depend on them.

Check out the more detailed explanation on my [![Medium](https://img.shields.io/badge/Medium-12100E?style=for-the-badge&logo=medium&logoColor=white)](https://medium.com/@adha_fajri/swiftui-mvvm-101-8198dc3855ab)
