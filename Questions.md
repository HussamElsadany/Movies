## Questions

### 1. Provide a high-level review of the application. Give your opinion on both aspects you consider positive and aspects you consider negative. Describe how and why would you do things differently.
- Positive aspects:
    - Code was readable and easy to understand.
    - Using native packages and avoiding using third parties.  
- Negative aspects:
    - Some files are hard to test and need modification like **CommonMovieService**.
    - The binding inside Repository, I prefer using delegation or closures.

### 2. The logic of ImageCache hides an issue. Try to discover and fix it.
- (Done), Founded *loadingResponses and runningRequests* keeps urls data after finishing the request and return the requested image.
    
    
### 3. Replace the binding between Repository and View model without combine.
- (Done).


### 4. Replace the Popular detail view with a new custom detail view. This view should display a detail with the info of the model movie model. Please use SwiftUI for the detailed view.
- (Done).


### 5. Replace the TopRated tab with a new list view. This view should display a list of the TopRated movies and it must be implemented programmatically using UIKit.
- (Done).


### 6. Write unit tests whereever you need them.
- (Done), Covered Data and Domain Layer, and most important parts in presentation layer (ViewModels).


### 7. In MoviewRow.swift line 11 we use @StateObject, could we change it with @ObservedObject? what are the differences?
- **@StateObject and @ObservedObject** look the same and both conform to **ObservableObject** protocol, but differ in how SwiftUI manages their lifecycle.
- **@ObservedObject** destroyed and re-instantiated every time the containing view redraws but **@StateObject** doesn't.
- A not completely unimportant implication of **@StateObject** is performance. If you're using an **@ObservedObject** that's recreated often that might harm your view's rendering performance. Since @StateObject is not recreated for every view re-render, it has a far smaller impact on your view's drawing cycle.
- but there is an issue here as **MovieRow** is embedded inside a **NavigationLink**, and List really does not create new instances of row, but reuses created before. However **NavigationLink** creates new instance every time, so changing from @StateObject to **@ObservableObject** won't affect in our case.


### 8. In PopularMoviesListViewModel.swift we ask for popular movies, using the current implementation fetch top rated movies instead, and explain what is happening.
- The network responded with the error message "Operation was cancelled" because the session is deinitialized after the client calls the request and there is no reference for the client in **MoviesRepository** to prevent deinitialization.


### 9. Implement load more functionality for Popular movies list screen.
-(Done), but unfortunately it has an issue, The request is repeated as it's not updating the page number in the api gateway, I have an issue in the Data Layer repository to update the new page, and changing is gonna affect the tests I written so I don't have enough time to modify.
